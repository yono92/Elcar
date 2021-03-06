package com.elcar.board;

import java.util.List;

import com.elcar.dto.Board;
import com.elcar.dto.PageInfo;

public interface BoardService {

	void write(Board board)throws Exception;

	List<Board> boardList(int page, PageInfo pageInfo, String search_text)throws Exception;

	List<Board> selectBoardList_type(int page, PageInfo pageInfo,int type)throws Exception;

	Board getBoard(int num)throws Exception;

	void deleteboard(int num)throws Exception;

	void modifyBoard(Board board)throws Exception;

	
}
