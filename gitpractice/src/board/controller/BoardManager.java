package board.controller;

import java.util.ArrayList;
<<<<<<< HEAD
=======
<<<<<<< HEAD
import java.util.Scanner;

import board.model.vo.Board;

public class BoardManager {
	ArrayList<Board> list = new ArrayList<Board>();
	Scanner sc = new Scanner(System.in);
	
	public void writeBoard() {
		System.out.println("ìƒˆ ê²Œì‹œê¸€ ì“°ê¸° ìž…ë‹ˆë‹¤");
		System.out.print("ê¸€ì œëª© : ");
		String title = sc.nextLine();
		System.out.print("ìž‘ì„±ìž : ");
		String author = sc.nextLine();
		System.out.print("ê¸€ë‚´ìš© : ");
		String content = sc.nextLine();
		list.add(new Board(title, author, content));
=======
import java.util.Iterator;
import java.util.List;
>>>>>>> 78a3ca3ab00db2f15f6004950a44a11315e051e8
import java.util.Scanner;

import board.model.vo.Board;

public class BoardManager {
<<<<<<< HEAD
	private ArrayList<Board> list = new ArrayList<Board>();

	public void displayAllList() {

		if (list.isEmpty()) {
			System.out.println("°Ô½ÃÆÇÀÌ ºñ¾ú´Ù.");
		} else {
			for (Board b : list) {
				System.out.println(b);
			}
		}
	}

	public void modifyContent() {
		Scanner sc = new Scanner(System.in);

		System.out.println("¼öÁ¤ÇÒ ±Û ¹øÈ£: ");
		int num=sc.nextInt();
		System.out.println("¼öÁ¤ÇÒ ³»¿ë : ");
		String newContent=sc.nextLine();
		for(int i=0; i<list.size();i++) {
			if(list.get(i).getBoardNo()==num) {
				list.get(i).setBoardContent(newContent);
				
			}
		}
//		list¸¦ for¹®À¸·Î µ¹¸é¼­ ¹æ±Ý ÀÔ·Â¹ÞÀº ¼öÁ¤±Û ¹øÈ£¶û list¿¡ µé¾îÀÖ´Â ¹øÈ£¿Í ÀÏÄ¡ÇÏ¸é ¼öÁ¤À» ÇØ¼­ if¹®.
//		if¹® ¾È¿¡¼­ º¯°æÇÒ ³»¿ëÀ» ¹Þ¾Æ¾ßÇÔ. System.out.println();
//		exit¸¦ ÀÔ·Â¹Þ°Ô µÇ¸é ¹«ÇÑ·çÇÁ¸¦ ºüÁ®³ª°¡¾ßÇÔ. 
	
		

=======
	
	Scanner sc=new Scanner(System.in);

	public void displayBoard(){
		System.out.println("ì¡°íšŒí•˜ì‹¤ ê¸€ ë²ˆí˜¸ë¥¼ ìž…ë ¥í•˜ì„¸ìš”");
		int searchNo=sc.nextInt();
		ArrayList<Board> boardList=new ArrayList<Board>();
		for(int i=0; i<boardList.size(); i++) {
			if(boardList.get(i).getBoardNo()==searchNo) {
				System.out.println(boardList.get(i).getBoardContent().toString());
			}
		}
		
	}
	
	public void deleteBoard(){
		System.out.println("ì‚­ì œí•  ê¸€ ë²ˆí˜¸ë¥¼ ìž…ë ¥í•˜ì„¸ìš”");
		int deleteNo=sc.nextInt();
		ArrayList<Board> boardList=new ArrayList<Board>();
		for(int i=0; i<boardList.size(); i++) {
			if(boardList.get(i).getBoardNo()==deleteNo) {
				System.out.println(boardList.get(i).getBoardContent().toString());
			}
		}
		System.out.println("ì •ë§ë¡œ ì‚­ì œí•˜ì‹œê² ìŠµë‹ˆê¹Œ?(y/n)");
		if(sc.next()=="y" || sc.next()=="Y") {
			for(int i=0;i<boardList.size();i++) {
				if(boardList.get(i).getBoardNo()==deleteNo)
					boardList.remove(i);
					System.out.println(deleteNo+"ë²ˆ ê¸€ì´ ì‚­ì œë˜ì—ˆìŠµë‹ˆë‹¤.");
			}
		}
		
>>>>>>> origin/inhee
>>>>>>> 78a3ca3ab00db2f15f6004950a44a11315e051e8
	}
}
