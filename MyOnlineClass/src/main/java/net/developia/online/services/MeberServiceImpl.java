package net.developia.online.services;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.developia.online.dao.MemberDAO;
import net.developia.online.dto.LectureDTO;
import net.developia.online.dto.MemberDTO;

@Slf4j
@Service
public class MeberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void join(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.selectMemberById(map);
			List<MemberDTO> output = (List) map.get("MemberList");
			if (output.size() != 0) {
				throw new RuntimeException("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
			} else {
				memberDAO.insert(map);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void getMemberById(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.selectMemberById(map);
			List<MemberDTO> output = (List) map.get("MemberList");
			if (output.size() != 0) {
				throw new RuntimeException("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}

	}

	@Override
	public void login(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.selectMember(map);
			List<MemberDTO> output = (List) map.get("MemberList");
			if (output.size() == 0) {
				throw new RuntimeException("아이디 혹은 비밀번호가 일치하지 않습니다.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void updateInfo(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.updateInfo(map);
			int output = Integer.parseInt(map.get("result").toString());
			if (output == 0) {
				throw new RuntimeException("회원 정보를 수정할 수 없습니다. 비밀번호를 확인해주세요.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MemberDTO> getMember() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteMember(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.deleteMember(map);
			int output = Integer.parseInt(map.get("result").toString());
			if (output == 0) {
				throw new RuntimeException("탈퇴할 수 없습니다. 비밀번호를 확인해주세요.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public List<MemberDTO> searchMember(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updatePassword(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		try {
			memberDAO.updatePassword(map);
			int output = Integer.parseInt(map.get("result").toString());
			if (output == 0) {
				throw new RuntimeException("비밀번호가 일치하지 않습니다.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void getMemberByEmail(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.selectMemberByEmail(map);
			List<MemberDTO> output = (List) map.get("MemberList");
			if (output.size() != 0) {
				throw new RuntimeException("이미 사용 중인 이메일입니다. 다른 이메일을 입력해주세요.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}

	}

	@Override
	public void getMemberByPhone(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.selectMemberByPhone(map);
			List<MemberDTO> output = (List) map.get("MemberList");
			if (output.size() != 0) {
				throw new RuntimeException("번호가 사용중입니다. 다른 번호를 입력해주세요.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void findId(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		try {
			memberDAO.findId(map);
			int output = Integer.parseInt(map.get("result").toString());
			if (output == 0) {
				throw new RuntimeException("생성된 계정이 없습니다. 회원가입을 진행해주세요.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}

	}

	@Override
	public void findPw(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		try {
			memberDAO.findPw(map);
			int output = Integer.parseInt(map.get("result").toString());
			if (output == 0) {
				throw new RuntimeException("생성된 계정이 없습니다. 회원가입을 진행해주세요.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}

	}

	@Override
	public void getMemberLecture(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.getMemberLecture(map);
			List<LectureDTO> output = (List) map.get("MemberLectureList");
			if (output.size() == 0) {
				throw new RuntimeException("등록된 과목이 없습니다.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void getMemberLectureDate(HashMap<String, Object> new_map) throws Exception {
		try {
			memberDAO.getMemberLectureDate(new_map);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void getInstructorInfo(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.getInstructorInfo(map);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	public List<LectureDTO> checkMemberLecture(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.getMemberLecture(map);
			List<LectureDTO> output = (List) map.get("MemberLectureList");
			return output;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void getInstructorLecture(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.getInstructorLecture(map);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	@Override
	public void getLectureCount(HashMap<String, Object> map) throws Exception {
		try {
			memberDAO.getLectureCount(map);
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}

	}

}
