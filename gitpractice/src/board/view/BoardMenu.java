package board.view;

<<<<<<< HEAD
=======
import java.util.Scanner;

import board.controller.BoardManager;
>>>>>>> 78a3ca3ab00db2f15f6004950a44a11315e051e8

public class BoardMenu {
<<<<<<< HEAD

	private Scanner sc = new Scanner(System.in);
	private BoardManager bm = new BoardManager();

	public BoardMenu() {
		// TODO Auto-generated constructor stub
	}

	public void mainMenu() {

		while(true) {
		System.out.println("******* 게시글 서비스 프로그램 *******");
		System.out.println("1. 게시글 쓰기"); // BoardManager의 writeBoard() 실행
		System.out.println("2. 게시글 전체 보기"); // displayAllList()
		System.out.println("3. 게시글 한개 보기"); // displayBoard()
		System.out.println("4. 게시글 제목 수정"); // modifyTitle()
		System.out.println("5. 게시글 내용 수정"); // modifyContent()
		System.out.println("6. 게시글 삭제"); // deleteBoard()
		System.out.println("7. 게시글 검색"); // searchBoard()
		System.out.println("8. 파일에 저장하기"); // saveListFile()
		System.out.println("9. 정렬하기"); // BookMenu 의 sortSubMenu() 실행
		System.out.println("9. 끝내기	"); // main() 으로 리턴함
		System.out.print("메뉴 번호 선택 : ");
		switch (sc.nextLine()) {
			case "1":
				bm.writeBoard();
				break;
			case "2":
				bm.displayAllList();
				break;
			case "3":
				bm.displayBoard();
				break;
			case "4":
				bm.modifyTitle();
				break;
			case "5":
				bm.modifyContent();
				break;
			case "6":
				bm.deleteBoard();
				break;
			case "7":
				bm.searchBoard();
				break;
			case "8":
				bm.saveListFile();
				break;
			case "9":
				bm.sortSubMenu();
				break;
			case "10":
				System.out.println("프로그램 종료");
				return;
			default:
				System.out.println("잘못된 입력");
				break;
			}
		}
	}

<<<<<<< HEAD



=======
	public void sortSubMenu() {
		
		System.out.println("****** 게시글 정렬 메뉴 ******");
		System.out.println("1. 글번호순 오름차순정렬");	//BookManager 의 	sortList(1, false) 실행
		System.out.println("2. 글번호순 내림차순정렬");	//		sortList(1, true) 실행
		System.out.println("3. 작성날짜순 오름차순정렬");	//		sortList(2, false) 실행		
		System.out.println("4. 작성날짜순 내림차순정렬");	//		sortList(2, true) 실행
		System.out.println("5. 글제목순 오름차순정렬");	//		sortList(3, false) 실행
		System.out.println("6. 글제목순 내림차순정렬");	//		sortList(3, true) 실행
		System.out.println("7. 이전 메뉴로 이동");		//return 처리
		System.out.print("메뉴 번호 : ");
		switch (sc.nextLine()) {
		case "1":
			bm.sortList(1, false);
			break;
		case "2":
			bm.sortList(1, true);
			break;
		case "3":
			bm.sortList(2, false);
			break;
		case "4":
			bm.sortList(2, true);
			break;
		case "5":
			bm.sortList(3, false);
			break;
		case "6":
			bm.sortList(3, true);
			break;
		case "7":
			System.out.println("이전 화면으로 이동");
			return;
		default:
			System.out.println("잘못된 입력");
			break;
		}
	}
	
	
=======
>>>>>>> origin/jackson
	
>>>>>>> 78a3ca3ab00db2f15f6004950a44a11315e051e8
}
