package com.elcar.member;

import com.elcar.dto.Member;

public interface MemberService {

	Member selectMember_kakao(String id) throws Exception;

	void insertMember_kakao(Member mem) throws Exception;

	void insertMember(Member mem)throws Exception;

	boolean access(String id, String pw)throws Exception;

	boolean emailcheck(String email)throws Exception;

	boolean nicknameCheck(String nickname)throws Exception;

	boolean idCheck(String id)throws Exception;

	boolean EmailCheck(String email, String name) throws Exception;

	Member searchId(String name, String birth)throws Exception;

	boolean phoneCheck(String phone) throws Exception;

	int getType(String id) throws Exception;
}
