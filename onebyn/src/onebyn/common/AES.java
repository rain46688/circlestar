package onebyn.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;

public class AES {
	private static SecretKey key;
	private String path;

	public AES() {

		this.path = AES.class.getResource("/").getPath();
		System.out.println("this.path : "+this.path);
		File f = new File(this.path + "/oneby.n");

		if (f.exists()) {
			try (ObjectInputStream oid = new ObjectInputStream(new FileInputStream(f))) {
				key = (SecretKey) (oid.readObject());
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			if (key == null) {
				getGenerator();
			}
		}
	}

	private void getGenerator() {
		SecureRandom ser = new SecureRandom();
		KeyGenerator keygen = null;
		try {
			keygen = KeyGenerator.getInstance("AES");
			keygen.init(128, ser);
			this.key = keygen.generateKey();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		File f = new File(this.path + "/oneby.n");
		try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(f))) {
			oos.writeObject(this.key);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String enc(String str) throws Exception {
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, key);
		byte[] encrypt = str.getBytes(Charset.forName("UTF-8"));
		byte[] result = cipher.doFinal(encrypt);
		String strResult = Base64.getEncoder().encodeToString(result);
		return strResult;
	}

	public static String dec(String str) throws Exception {
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE, key);
		byte[] decodeStr = Base64.getDecoder().decode(str.getBytes(Charset.forName("UTF-8")));
		byte[] decypt = cipher.doFinal(decodeStr);
		return new String(decypt);
	}

}
