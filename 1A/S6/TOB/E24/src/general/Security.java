package general;
//import sun.misc.BASE64Decoder;
//import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Base64;

/**
 * Encryption and Decryption of String data
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class Security {

    /**
     * Attribut of Security
     */
    private static final char[] PASSWORD = "enfldsgbnlsngdlksdsgm".toCharArray();
    private static final byte[] SALT = {(byte) 0xde, (byte) 0x33, (byte) 0x10, (byte) 0x12, (byte) 0xde, (byte) 0x33,
            (byte) 0x10, (byte) 0x12,};

    /**
     * Encrypt the given string
     *
     * @param property the string to encrypt
     * @return the encrypted string
     * @throws GeneralSecurityException
     * @throws UnsupportedEncodingException
     */
    public String encrypt(String property) throws GeneralSecurityException, UnsupportedEncodingException {
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("PBEWithMD5AndDES");
        SecretKey key = keyFactory.generateSecret(new PBEKeySpec(PASSWORD));
        Cipher pbeCipher = Cipher.getInstance("PBEWithMD5AndDES");
        pbeCipher.init(Cipher.ENCRYPT_MODE, key, new PBEParameterSpec(SALT, 20));
        return base64Encode(pbeCipher.doFinal(property.getBytes("UTF-8")));
    }

    /**
     * the base we use to encode
     *
     * @param bytes the bytes to encode
     * @return a string in base 64
     */
    private static String base64Encode(byte[] bytes) {
        // NB: This class is internal, and you probably should use another impl
    	return Base64.getEncoder().encodeToString(bytes);
    	//return new BASE64Encoder().encode(bytes);
    }

    /**
     * Decrypt the encrypted string
     *
     * @param property the encrypted string
     * @return return the original string
     * @throws GeneralSecurityException
     * @throws IOException
     */
    public static String decrypt(String property) throws GeneralSecurityException, IOException {
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("PBEWithMD5AndDES");
        SecretKey key = keyFactory.generateSecret(new PBEKeySpec(PASSWORD));
        Cipher pbeCipher = Cipher.getInstance("PBEWithMD5AndDES");
        pbeCipher.init(Cipher.DECRYPT_MODE, key, new PBEParameterSpec(SALT, 20));
        return new String(pbeCipher.doFinal(base64Decode(property)), "UTF-8");
    }

    /**
     * the base we use to decode
     *
     * @param property the bytes to decodes
     * @return a string in base 64
     * @throws IOException
     */
    private static byte[] base64Decode(String property) throws IOException {
        // NB: This class is internal, and you probably should use another impl
    	return Base64.getDecoder().decode(property);
        //return new BASE64Decoder().decodeBuffer(property);
    }

}