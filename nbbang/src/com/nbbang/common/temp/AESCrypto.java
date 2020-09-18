package com.nbbang.common.temp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

public class AESCrypto {
	
	private static SecretKey key;
	private String path;
	
	public AESCrypto() {
		this.path=AESCrypto.class.getResource("/").getPath();
		File f=new File(this.path+"/nbbang.nb");
		
		if(f.exists()) {
			try(ObjectInputStream ois=new ObjectInputStream(new FileInputStream(f))){
				key=(SecretKey)(ois.readObject());
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			if(key==null) {
				getGenerator();
			}
		}
	}
	
	private void getGenerator() {
		SecureRandom scr=new SecureRandom();
		KeyGenerator keygen=null;
		try {
			keygen=KeyGenerator.getInstance("AES");
			keygen.init(128,scr);
			this.key=keygen.generateKey();
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		File f=new File(this.path+"/nbbang.nb");
		try(ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(f))){
			oos.writeObject(this.key);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String encrypt(String str) {
		Cipher cipher=Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE,key);
		byte[] encrypt
	}
}
