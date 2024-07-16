package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.ReservationReviewDTO;
import kr.co.dingdong.repository.ReservationRepository;
import kr.co.dingdong.repository.ReservationReviewRepository;

@Service
public class ReservationReviewServiceImpl implements ReservationReviewService{

	@Autowired
	ReservationReviewRepository reservationReviewRepository;
	@Autowired
	ReservationRepository reservationRepository;
	
	@Override
	public List<ReservationReviewDTO> reviewList(int roomNumber) {
		// TODO Auto-generated method stub
		
		return reservationReviewRepository.reviewList(roomNumber);
	}

	@Override
	public ReservationReviewDTO detail(String reservationNumber) {
		// TODO Auto-generated method stub
		return reservationReviewRepository.detail(reservationNumber);
	}

	@Override
	public int insert(ReservationReviewDTO reservationReviewDTO) {
		// TODO Auto-generated method stub
		return reservationReviewRepository.insert(reservationReviewDTO);
	}

	@Override
	public int delete(String reservationNumber) {
		// TODO Auto-generated method stub
		
		ReservationReviewDTO reservationReview = detail(reservationNumber);
		reservationReview.setDel(1);
		
		
		return reservationReviewRepository.delete(reservationNumber);
	}

	
	
	
}
