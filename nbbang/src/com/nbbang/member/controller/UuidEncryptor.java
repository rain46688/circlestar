package com.nbbang.member.controller;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class UuidEncryptor {
	public String getSha512(String value) {
		String encPwd=null;
		MessageDigest md=null;
		try {
			md=MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes=value.getBytes(Charset.forName("UTF-8"));
		md.update(bytes);
		encPwd=Base64.getEncoder().encodeToString(md.digest());
		return encPwd;
	}
}
