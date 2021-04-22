package com.web.toosome.user.basket.vo;

import java.util.List;

import com.web.toosome.user.membership.vo.LevelVO;
import com.web.toosome.user.membership.vo.MembershipVO;
import com.web.toosome.user.product.vo.ProductImageVO;

import lombok.Data;

@Data
public class BasketUtil {

	private int point; // 적립 포인트
	private int discount; // 할인 금액
	private int total; // 총 결제금액
	private int amount; // 총 주문상품수
	private int deliveryPay = 2000; // 배송비
	private int realPayment; // 실제 결제 금액 
	
	public void utilMethod(List<BasketVO> baskets, MembershipVO ms, String basicImagePath) {
		
		for(BasketVO basket : baskets) {
			ProductImageVO imageVO = basket.getProductImageVO();
			String imagePath = basicImagePath + imageVO.getProductImageRoute() + "/" + imageVO.getProductImageName() + "." + imageVO.getProductImageExtention();
			basket.setImagePath(imagePath);
		}
		
		for(BasketVO basket : baskets) {
			total += basket.getBasketPrice() * basket.getBasketAmount();
			amount += basket.getBasketAmount();
		}
		
		if(ms != null) {
			LevelVO lvl = ms.getLevel();
			deliveryPay = lvl.getLevelDeliveryPay(); 
			point = (int) (total * (lvl.getLevelPointRate() / 100.0)); 
			discount = (int) (total * (lvl.getLevelDiscountRate() / 100.0)); 
			realPayment = total - discount - deliveryPay;
		}else {
			realPayment = total - deliveryPay;
		}
	}
}
