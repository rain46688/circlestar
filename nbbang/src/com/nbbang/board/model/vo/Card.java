package com.nbbang.board.model.vo;

public class Card {
	private Board cardBoard;
	private BoardFile cardFile;
	private String writerProfile;
	
	public Card() {
		// TODO Auto-generated constructor stub
	}

	public Card(Board cardBoard, BoardFile cardFile) {
		super();
		this.cardBoard = cardBoard;
		this.cardFile = cardFile;
	}

	public Board getCardBoard() {
		return cardBoard;
	}

	public void setCardBoard(Board cardBoard) {
		this.cardBoard = cardBoard;
	}

	public BoardFile getCardFile() {
		return cardFile;
	}

	public void setCardFile(BoardFile cardFile) {
		this.cardFile = cardFile;
	}

	public String getWriterProfile() {
		return writerProfile;
	}

	public void setWriterProfile(String writerProfile) {
		this.writerProfile = writerProfile;
	}

	@Override
	public String toString() {
		return "Card [cardBoard=" + cardBoard + ", cardFile=" + cardFile + ", writerProfile=" + writerProfile + "]";
	}
}
