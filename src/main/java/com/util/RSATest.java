package com.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;

import org.json.JSONObject;

public class RSATest {

	private PrivateKey privateKey;
    private PublicKey publicKey;

    public RSATest() throws NoSuchAlgorithmException {
        KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA");
        keyGen.initialize(1024);
        KeyPair pair = keyGen.generateKeyPair();
        this.privateKey = pair.getPrivate();
        this.publicKey = pair.getPublic();
    }
    
    public JSONObject getJsonObject() {
    	
    	JSONObject keyJSONObject = new JSONObject();
    	
    	keyJSONObject.put("publicKey", Base64.getEncoder().encodeToString(this.publicKey.getEncoded()));
    	keyJSONObject.put("privateKey", Base64.getEncoder().encodeToString(this.privateKey.getEncoded()));
    	
    	return keyJSONObject;
    }

    public void writeToFile(String path, byte[] key) throws IOException {
        File f = new File(path);
        f.getParentFile().mkdirs();

        FileOutputStream fos = new FileOutputStream(f);
        fos.write(key);
        fos.flush();
        fos.close();
    }

    public PrivateKey getPrivateKey() {
        return privateKey;
    }

    public PublicKey getPublicKey() {
        return publicKey;
    }
    
    public String getEncodeString(String text, String publicKey) {
    	String returnText = "";
    	try {
			Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
			
			X509EncodedKeySpec keySpec = new X509EncodedKeySpec(Base64.getDecoder().decode(publicKey.getBytes()));
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            
			cipher.init(Cipher.ENCRYPT_MODE, keyFactory.generatePublic(keySpec));
			
			byte[] outByteArray = cipher.doFinal(text.getBytes());
			
			returnText = Base64.getEncoder().encodeToString(outByteArray);
			System.out.println(outByteArray);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return returnText;
    }
    
    public String getDecodeString(String text, String privateKey) {
    	String returnText = "";
    	
    	try {
    		 PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(Base64.getDecoder().decode(privateKey.getBytes()));
    		 KeyFactory keyFactory = KeyFactory.getInstance("RSA");
    		 PrivateKey privateKeyObj = keyFactory.generatePrivate(keySpec);
    		 
    		 Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
    		 cipher.init(Cipher.DECRYPT_MODE, privateKeyObj);
    		 returnText = new String(cipher.doFinal(Base64.getDecoder().decode(text.getBytes())));
    		 //decrypt(Base64.getDecoder().decode(text.getBytes()), privateKeyObj);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return returnText;
    }
    
    public static void main(String[] args) throws Exception {
    	RSATest keyPairGenerator = new RSATest();
        //keyPairGenerator.writeToFile("B:/RSA/publicKey", keyPairGenerator.getPublicKey().getEncoded());
        //keyPairGenerator.writeToFile("B:/RSA/privateKey", keyPairGenerator.getPrivateKey().getEncoded());
        //System.out.println(Base64.getEncoder().encodeToString(keyPairGenerator.getPublicKey().getEncoded()));
        //System.out.println(Base64.getEncoder().encodeToString(keyPairGenerator.getPrivateKey().getEncoded()));
    	JSONObject jsonObj = keyPairGenerator.getJsonObject();
    	
    	String text = keyPairGenerator.getEncodeString("Hi", jsonObj.getString("publicKey"));
    	String text2 = keyPairGenerator.getDecodeString(text, jsonObj.getString("privateKey"));
    	System.out.println(text);
    	System.out.println(text2);
    	
    	System.out.println("**********************");
    	System.out.println(jsonObj.toString());
    }
}
