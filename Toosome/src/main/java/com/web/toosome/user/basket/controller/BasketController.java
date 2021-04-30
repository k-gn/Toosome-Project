package com.web.toosome.user.basket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.apache.http.HttpResponse;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.web.toosome.user.basket.service.IBasketService;
import com.web.toosome.user.basket.vo.BasketUtil;
import com.web.toosome.user.basket.vo.BasketVO;
import com.web.toosome.user.basket.vo.OrdersDetailVO;
import com.web.toosome.user.basket.vo.OrdersVO;
import com.web.toosome.user.member.service.IMemberService;
import com.web.toosome.user.member.vo.MemberVO;
import com.web.toosome.user.membership.service.IMembershipService;
import com.web.toosome.user.membership.vo.MembershipVO;
import com.web.toosome.user.product.vo.ProductImageVO;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BasketController {

	private final String basicImagePath = "https://toosome.s3.ap-northeast-2.amazonaws.com/";

	@Autowired
	private IBasketService service;

	@Autowired
	private IMembershipService mservice;

	@Autowired
	private IMemberService memberService;

	// 장바구니 페이지 이동
	@GetMapping("/basket") // 장바구니
	public String basket(HttpSession session, Model model, BasketUtil basketUtil) {
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		model.addAttribute("baskets", baskets);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		basketUtil.utilMethod(baskets, ms, basicImagePath);
		return "subpages/basket/basket";
	}

	@GetMapping("/basket/order") // 주문
	public String order(HttpSession session, BasketUtil basketUtil, Model model, RedirectAttributes ra) {
		System.out.println("상품 구매 페이지 출력");
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);

		if (baskets == null || baskets.size() == 0) {
			ra.addFlashAttribute("msg", "empty");
			return "redirect:/basket";
		}

		model.addAttribute("baskets", baskets);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		basketUtil.utilMethod(baskets, ms, basicImagePath);
		MemberVO memberList = memberService.getUserById(memberId);
		Map<String, String> map = new HashMap<>();
		System.out.println(memberList);
		if (memberList.getMemberPhone() != null && memberList.getMemberAddress() != null) {
			// 01040178803
			String tel1 = memberList.getMemberPhone().substring(0, 3);
			String tel2 = memberList.getMemberPhone().substring(3, 7);
			String tel3 = memberList.getMemberPhone().substring(7);
			map.put("tel1", tel1);
			map.put("tel2", tel2);
			map.put("tel3", tel3);
			String[] addressArr = memberList.getMemberAddress().split("-");
			map.put("postcode", memberList.getMemberPostcode());
			for (int i = 0; i < addressArr.length; i++) {
				map.put("address" + (i + 1), addressArr[i]);
			}
		} else {
			map.put("tel1", "010");
		}
		model.addAttribute("map", map);
		model.addAttribute("memberList", memberList);
		MembershipVO memberPoint = mservice.getMembershipInfo(memberId);
		model.addAttribute("memberPoint", memberPoint);
		// double realPayment = basketUtil.getRealPayment(); // 할인전 금액

		if (memberService.getUserById(memberId).getMemberPostcode() != null
				&& memberService.getUserById(memberId).getMemberPhone() != null) {
			return "subpages/basket/order/order";
		} else {

			return "mypage/update/" + memberId;

		}

	}

	@GetMapping("/basket/ordercomplete") // 주문완료
	public String ordercomplete() {
		return "subpages/basket/order/orderComplete/orderComplete";
	}

	@GetMapping("orderreceipt") // 주문내역
	public String orderreceipt(OrdersVO ordersVO, Model model, HttpSession session, ProductImageVO imageVO) {
		System.out.println("주문 내역 페이지 출력");
		Integer memberId = (Integer) session.getAttribute("id");
		List<OrdersVO> orderList = service.getAllOrdersList(memberId);
		System.out.println(orderList);
		model.addAttribute("orderList", orderList);
		
		return "subpages/basket/order/orderReceipt/orderReceipt";
	}

	// 장바구니 추가
	@PostMapping("/basket")
	@ResponseBody
	public String addBasket(@RequestBody BasketVO basket, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("id");
		basket.setMemberId(memberId);
		int result = service.addBasket(basket);
		if (result == 1)
			return "addSuccess";
		else
			return "addFail";
	}

	// 장바구니 수정
	@PutMapping("/basket/{bid}")
	@ResponseBody
	public BasketUtil modBasket(@PathVariable Integer bid, @RequestBody Integer amount, HttpSession session,
			BasketUtil basketUtil) {
		service.setBasketAmount(amount, bid);
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		basketUtil.utilMethod(baskets, ms, basicImagePath);
		return basketUtil;
	}

	// 장바구니 삭제
	@DeleteMapping("/basket/{bid}")
	@ResponseBody
	public String delBasket(@PathVariable Integer bid) {
		int result = service.delBasket(bid);
		if (result > 0)
			return "success";
		else
			return "fail";
	}

	@PostMapping("/basket/order")
	@ResponseBody
	public String orderBasket(@RequestBody BasketUtil basketUtil, HttpSession session) {
		return null;
	}

	@GetMapping("/import2") // 결제 화면...
	public String import1(BasketVO basket, Model model, HttpSession session, Integer basketEndPrice,
			Integer basketsal) {
		System.out.println("상품 결제화면 호출");
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		model.addAttribute("baskets", baskets);
		System.out.println(baskets);
		MemberVO memberImportList = memberService.getUserById(memberId);
		model.addAttribute("memberImportList", memberImportList);
		model.addAttribute("basketEndPrice", basketEndPrice);
		System.out.println(basketEndPrice);
		model.addAttribute("basketsal", basketsal);
		System.out.println(basketsal);
		return "import2";
	}

	@ResponseBody
	@GetMapping("/productStactpoint")
	public String productStactpoint(BasketUtil basketUtil, HttpSession session, Integer basketEndPrice,
			Integer basketsal, String merchantUid, OrdersVO ordersVO) {
		System.out.println("상품 결제 후 포인트 적립");
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		basketUtil.utilMethod(baskets, ms, basicImagePath);
		double basketPrice = basketUtil.getTotal();
		System.out.println(basketPrice);
		double imsipoint = basketPrice * 0.01; // 적립 포인트
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("id", memberId);
		map.put("imsipoint", (int) imsipoint);
		System.out.println((int) imsipoint); // 적립포인트
		mservice.getStackPoint(map);
		System.out.println("getStackPoint 실행 완료");
		Integer usedPoint = basketsal - basketEndPrice;
		System.out.println(usedPoint); // 사용포인트
		map.put("usedPoint", usedPoint);
		mservice.getDownPoint(map);
		System.out.println("getDownPoint 실행 완료");
		Integer id =  service.getOrdersList(memberId).getOrdersId();
		ordersVO.setOrdersId(id);
		ordersVO.setOrdersMerchantUid(merchantUid);
		service.updateMerchantUid(ordersVO);
		return "OK";
	}

	@GetMapping("/orderComplete")
	public String orderComplete(BasketUtil basketUtil, Model model, HttpSession session, Integer basketEndPrice,
			Integer basketsal) {
		System.out.println("상품 결제 완료 페이지 호출");
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		model.addAttribute("baskets", baskets);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		basketUtil.utilMethod(baskets, ms, basicImagePath);
		MemberVO memberList = memberService.getUserById(memberId);
		Map<String, String> map = new HashMap<>();
		if (memberList.getMemberPhone() != null && memberList.getMemberAddress() != null) {
			// 01040178803
			String tel1 = memberList.getMemberPhone().substring(0, 3);
			String tel2 = memberList.getMemberPhone().substring(3, 7);
			String tel3 = memberList.getMemberPhone().substring(7);
			map.put("tel1", tel1);
			map.put("tel2", tel2);
			map.put("tel3", tel3);
			String[] addressArr = memberList.getMemberAddress().split("-");
			map.put("postcode", memberList.getMemberPostcode());
			for (int i = 0; i < addressArr.length; i++) {
				map.put("address" + (i + 1), addressArr[i]);
			}
		} else {
			map.put("tel1", "010");
		}
		model.addAttribute("map", map);
		model.addAttribute("memberList", memberList);
		model.addAttribute("basketEndPrice", basketEndPrice);
		Integer usedPoint = basketsal - basketEndPrice;
		model.addAttribute("usedPoint", usedPoint);

		OrdersVO orderList = service.getOrdersList(memberId);
		Map<String, String> map1 = new HashMap<>();
		if (orderList.getOrdersPhone() != null && orderList.getOrdersAddress() != null) {
			// 01040178803
			String tel1 = orderList.getOrdersPhone().substring(0, 3);
			String tel2 = orderList.getOrdersPhone().substring(3, 7);
			String tel3 = orderList.getOrdersPhone().substring(7);
			map1.put("tel1", tel1);
			map1.put("tel2", tel2);
			map1.put("tel3", tel3);
			String[] addressArr1 = orderList.getOrdersAddress().split("-");
			map1.put("postcode", orderList.getOrdersPostcode());
			for (int i = 0; i < addressArr1.length; i++) {
				map1.put("addresstwo" + (i + 1), addressArr1[i]);
			}
		} else {
			map1.put("tel1", "010");
		}
		model.addAttribute("map1", map1);
		model.addAttribute("orderList", orderList);
		for (BasketVO basketOne : baskets) {
			basketOne.setOrdersId(service.getOrdersList(memberId).getOrdersId());
			service.basketsendorder(basketOne);
			service.orderBasketDel(memberId);
		}
		return "subpages/basket/order/orderComplete/orderComplete";
	}

	@PostMapping("/ordersubmit")
	@ResponseBody
	public String ordersubmit(@RequestBody OrdersVO order, HttpSession session, BasketUtil basketUtil, String merchantUid) {
		System.out.println("ordersubmit 메서드 실행");
		Integer memberId = (Integer) session.getAttribute("id");
		order.setMemberId(memberId);
		order.setOrdersDelivery(basketUtil.getDeliveryPay());
		int basketcount = service.getBasketList(memberId).size();
		System.out.println(basketcount);
		String basketName = service.getbasketName(memberId).getBasketName();
		String name = basketName + "외" + (basketcount-1) +"개";
		Integer amount = service.getbasketName(memberId).getBasketAmount();
		order.setOrdersProductName(name);
		order.setOrdersAmount(amount);
		int result = service.orderSubmit(order);
		if (result > 0)
			return "success";
		else
			return "fail";
	}

	@PostMapping("/ordersViewContent")
	@ResponseBody
	public List<OrdersDetailVO> ordersViewContent(Integer ordersId, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("id");
		Map<String, Integer> map = new HashMap<>();
		map.put("id", memberId);
		map.put("ordersId", ordersId);
		System.out.println(memberId);
		System.out.println(ordersId);
		List<OrdersDetailVO> ordersDetailList = service.getOrdersDetailList(map); 
		System.out.println(ordersDetailList);
		return ordersDetailList;
	}

	// 테스트 진행중....
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	public static final String KEY = "2495270673178832";
	public static final String SECRET = "3pXrXWleqhPI4QmOdvx3mTiAvx8OIBSL1PcYMydcP2UTThI6Ng99asJFZRuHtnsucFtYeHb3J5XCnFJa";

	// 아임포트 인증(토큰)을 받아주는 함수
	@PostMapping("/testToken")
	@ResponseBody
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
		Map<String, String> m = new HashMap<String, String>();
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			result = resNode.get("access_token").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(result);
		return result;
	}

	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수
	private List<NameValuePair> convertParameter(Map<String, String> paramMap) {
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		Set<Entry<String, String>> entries = paramMap.entrySet();
		for (Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	}

	// 결제취소
	@PostMapping("/cancelPayment")
	@ResponseBody
	public int cancelPayment(String token, String mid) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL);
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", mid);
		String asd = "";
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(enty);
			asd = rootNode.get("response").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (asd.equals("null")) {
			System.err.println("환불실패");
			return -1;
		} else {
			System.err.println("환불성공");
			return 1;
		}
	}

	// 아임포트 결제정보를 조회해서 결제금액을 뽑아주는 함수
	public String getAmount(String token, String mId) {
		String amount = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_PAYMENTINFO_URL + mId + "/paid");
		get.setHeader("Authorization", token);
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			amount = resNode.get("amount").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return amount;
	}

	// 아임포트 결제금액 변조는 방지하는 함수
	public void setHackCheck(String amount, String mId, String token) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
		Map<String, String> m = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		m.put("amount", amount);
		m.put("merchant_uid", mId);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			System.out.println(rootNode);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// public static void main(String...args) { // new
	// PaymentCheck().cancelPayment(new PaymentCheck().getImportToken(),
	// "merchant_1563254570837"); //

}
