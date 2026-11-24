
package dao;

import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public class PasswordUtilDAO {

    private static final int ITERATIONS = 120000;
    private static final int KEY_LENGTH = 256;
    private static final int SALT_LENGTH = 16;

    private static final SecureRandom RANDOM = new SecureRandom();

    public static String hashPassword(String password) throws Exception {

        byte[] salt = new byte[SALT_LENGTH];
        RANDOM.nextBytes(salt);

        byte[] hash = derive(password.toCharArray(), salt, ITERATIONS);

        return "PBKDF2$" + ITERATIONS + "$"
                + Base64.getEncoder().encodeToString(salt) + "$"
                + Base64.getEncoder().encodeToString(hash);
    }

    public static boolean verifyPassword(String password, String storedValue)
            throws Exception {

        if (storedValue == null) {
            return false;
        }

        // Support existing plain-text accounts during migration.
        if (!storedValue.startsWith("PBKDF2$")) {
            return storedValue.equals(password);
        }

        String[] parts = storedValue.split("\\$");

        if (parts.length != 4) {
            return false;
        }

        int iterations = Integer.parseInt(parts[1]);
        byte[] salt = Base64.getDecoder().decode(parts[2]);
        byte[] expected = Base64.getDecoder().decode(parts[3]);

        byte[] actual = derive(password.toCharArray(), salt, iterations);

        if (actual.length != expected.length) {
            return false;
        }

        int difference = 0;

        for (int i = 0; i < actual.length; i++) {
            difference |= actual[i] ^ expected[i];
        }

        return difference == 0;
    }

    private static byte[] derive(char[] password, byte[] salt, int iterations)
            throws Exception {

        PBEKeySpec spec = new PBEKeySpec(
                password, salt, iterations, KEY_LENGTH);

        try {
            return SecretKeyFactory
                    .getInstance("PBKDF2WithHmacSHA256")
                    .generateSecret(spec)
                    .getEncoded();

        } finally {
            spec.clearPassword();
        }
    }
}
