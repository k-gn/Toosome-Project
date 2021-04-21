package com.web.toosome.user.basket.vo;

import java.util.List;

import com.web.toosome.user.membership.vo.LevelVO;
import com.web.toosome.user.membership.vo.MembershipVO;

import lombok.Data;

@Data
public class BasketUtil {

	private Integer point; // 적립 포인트
	private Integer discount; // 할인율
	private Integer total; // 총 결제금액
	private Integer amount; // 총 주문상품수
	private Integer deliveryPay; // 배송비
	private Integer realPayment; // 실제 결제 금액 
	
	public void utilMethod(List<BasketVO> baskets, MembershipVO ms) {
		for(BasketVO basket : baskets) {
			total += basket.getBasketPrice();
			amount += basket.getBasketAmount();
		}
		LevelVO lvl = ms.getLevel();
		deliveryPay = lvl.getLevelDeliveryPay();
	}
}
