package com.web.toosome.user.basket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
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

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.toosome.admin.orderManagement.service.IOrderManagementService;
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

@Controller
public class BasketController {

	private final String basicImagePath = "https://toosome.s3.ap-northeast-2.amazonaws.com/";

	@Autowired
	private IBasketService service;

	@Autowired
	private IMembershipService mservice;

	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IOrderManagementService omService;

	// ???????????? ????????? ??????
	@GetMapping("/basket") // ????????????
	public String basket(HttpSession session, Model model, BasketUtil basketUtil) {
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		model.addAttribute("baskets", baskets);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		basketUtil.utilMethod(baskets, ms, basicImagePath);
		return "subpages/basket/basket";
	}

	@GetMapping("/basket/order") // ??????
	public String order(HttpSession session, BasketUtil basketUtil, Model model, RedirectAttributes ra) {
		System.out.println("?????? ?????? ????????? ??????");
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
		if (memberService.getUserById(memberId).getMemberPostcode() != null
				&& memberService.getUserById(memberId).getMemberPhone() != null) {
			return "subpages/basket/order/order";
		} else {
			return "subpages/basket/social/social";
		}
	}

	@GetMapping("/basket/ordercomplete") // ????????????
	public String ordercomplete() {
		return "subpages/basket/order/orderComplete/orderComplete";
	}

	@GetMapping("/orderreceipt") // ????????????
	public String orderreceipt(OrdersVO ordersVO, Model model, HttpSession session, ProductImageVO imageVO) {
		System.out.println("?????? ?????? ????????? ??????");
		Integer memberId = (Integer) session.getAttribute("id");
		List<OrdersVO> orderList = service.getAllOrdersList(memberId);
		model.addAttribute("orderList", orderList);
		return "subpages/basket/order/orderReceipt/orderReceipt";
	}

	// ???????????? ??????
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

	// ???????????? ??????
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

	// ???????????? ??????
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

	@GetMapping("/import2") // ?????? ??????...
	public String import1(BasketVO basket, Model model, HttpSession session, Integer basketEndPrice, Integer basketsal) {
		System.out.println("?????? ???????????? ??????");
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		model.addAttribute("baskets", baskets);
		MemberVO memberImportList = memberService.getUserById(memberId);
		model.addAttribute("memberImportList", memberImportList);
		model.addAttribute("basketEndPrice", basketEndPrice);
		model.addAttribute("basketsal", basketsal);
		return "import2";
	}

	@ResponseBody
	@GetMapping("/productStactpoint")
	public String productStactpoint(BasketUtil basketUtil, HttpSession session, Integer basketEndPrice,
			Integer basketsal, String merchantUid, OrdersVO ordersVO) {
		System.out.println("productStactpoint ????????? ??????");
		Integer memberId = (Integer) session.getAttribute("id");
		List<BasketVO> baskets = service.getBasket(memberId);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		basketUtil.utilMethod(baskets, ms, basicImagePath);
		double basketPrice = basketUtil.getTotal();
		double imsipoint = basketPrice * 0.01; // ?????? ?????????
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("id", memberId);
		map.put("imsipoint", (int) imsipoint);// ???????????????
		mservice.getStackPoint(map);
		System.out.println("getStackPoint ?????? ??????");
		Integer usedPoint = basketsal - basketEndPrice;
		map.put("usedPoint", usedPoint);// ???????????????
		mservice.getDownPoint(map);
		System.out.println("getDownPoint ?????? ??????");
		Integer id =  service.getOrdersList(memberId).getOrdersId();
		ordersVO.setOrdersId(id);
		ordersVO.setOrdersMerchantUid(merchantUid);
		int num = service.updateMerchantUid(ordersVO);
        if(num > 0) {
            return "OK";
        }else {
            return "NO";
        }
	}
	
	@GetMapping("/orderComplete")
	public String orderComplete(BasketUtil basketUtil, Model model, HttpSession session, Integer basketEndPrice, Integer basketsal) {
		System.out.println("?????? ?????? ?????? ????????? ??????");
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
			service.basketsendorder(basketOne);			// ???????????? ??????.
			service.orderBasketDel(memberId);			// ???????????? ????????? ??????.
		}
		
		System.out.println("setproductAmountDownCounter ??????");
		int ordersId = service.getOrdersList(memberId).getOrdersId();
		Map<String, Integer> map3 = new HashMap<>();
		map3.put("id", memberId);
		map3.put("ordersId", ordersId);
		List<OrdersDetailVO> ordersDetailList = service.getOrdersDetailList(map3);
		for (OrdersDetailVO ordersDetailListOne : ordersDetailList) {
			service.setproductAmountDownCounter(ordersDetailListOne);		
		}
		return "subpages/basket/order/orderComplete/orderComplete";
	}

	@PostMapping("/ordersubmit")
	@ResponseBody
	public String ordersubmit(@RequestBody OrdersVO order, HttpSession session, BasketUtil basketUtil, String merchantUid) {
		System.out.println("ordersubmit ????????? ??????");
		Integer memberId = (Integer) session.getAttribute("id");
		order.setMemberId(memberId);
		order.setOrdersDelivery(basketUtil.getDeliveryPay());
		int basketcount = service.getBasketList(memberId).size();
		String basketName = service.getbasketName(memberId).getBasketName();
		if(basketcount != 1) {
			String name = basketName + "??? " + (basketcount-1) +"???";
			order.setOrdersProductName(name);
		}else {
			String name = basketName;
			order.setOrdersProductName(name);
		}
		order.setOrdersMemberEmail(memberService.getUserById(memberId).getMemberEmail());
		List<BasketVO> baskets = service.getBasket(memberId);
		MembershipVO ms = mservice.getMembershipInfo(memberId);
		basketUtil.utilMethod(baskets, ms, basicImagePath);
		int msi = basketUtil.getDiscount();	// ?????? ??????
		int ProductPrice = basketUtil.getTotal();	// ?????? ?????? ??????
		order.setOrdersSal(msi);  
		int realpay = order.getOrdersPayment(); // ?????? ?????? ??????
		int UsePoint = ProductPrice - (msi +realpay);	// ????????? ?????????
		order.setOrdersUsePoint(UsePoint);
		order.setOrdersProductPay(ProductPrice);
		Integer amount = basketUtil.getAmount();
		order.setOrdersAmount(amount);
		int result = service.orderSubmit(order);
		if (result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

	@PostMapping("/ordersViewContent")
	@ResponseBody
	public List<OrdersDetailVO> ordersViewContent(Integer ordersId, HttpSession session) {
		Integer memberId = (Integer) session.getAttribute("id");
		Map<String, Integer> map = new HashMap<>();
		map.put("id", memberId);
		map.put("ordersId", ordersId);
		List<OrdersDetailVO> ordersDetailList = service.getOrdersDetailList(map); 
		return ordersDetailList;
	}
	
	@PostMapping("/getMerchantUid")
	@ResponseBody
	public String getMerchantUid(Integer ordersId) {
		String uid = service.getMerchantUid(ordersId);
		return uid;
	}
	
	@PostMapping("/ordersCancelReceipt")
	@ResponseBody
	public int ordersCancelReceipt(Integer ordersId, HttpSession session) {
		System.out.println("ordersCancelReceipt ????????? ??????");
		
		System.out.println("setproductAmountUpCounter ??????");
		Integer memberId = (Integer) session.getAttribute("id");
		Map<String, Integer> map3 = new HashMap<>();
		map3.put("id", memberId);
		map3.put("ordersId", ordersId);
		List<OrdersDetailVO> ordersDetailList = service.getOrdersDetailList(map3);
		for (OrdersDetailVO ordersDetailListOne : ordersDetailList) {
			service.setproductAmountUpCounter(ordersDetailListOne);		
		}
		
		OrdersVO ordersVO = omService.getorderDetail(ordersId);
		List<OrdersDetailVO> ordersDetailVO = omService.getorderDetailListTwo(ordersId);
		int num1 = service.setordersCancel(ordersVO);
		for (OrdersDetailVO OrdersDetailOne : ordersDetailVO) {
			OrdersDetailOne.setOrdersCancelId(service.getOrdersCancelId(ordersId));
			service.setordersCancelDetail(OrdersDetailOne);
		}
		int detailDel = service.ordersDetailDel(ordersId);
		int ordersDel = service.ordersDel(ordersId);
		if(detailDel > 0 && ordersDel > 0 && num1>0) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@PostMapping(value="/lookPost", produces ="application/text; charset=utf8")
	@ResponseBody
	public String lookPost(Integer ordersId) {
		String lookPost = service.getLookPostList(ordersId);
		return lookPost;

	}
	
	
	
	
	// ????????? ?????????....
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	public static final String KEY = "2495270673178832";
	public static final String SECRET = "3pXrXWleqhPI4QmOdvx3mTiAvx8OIBSL1PcYMydcP2UTThI6Ng99asJFZRuHtnsucFtYeHb3J5XCnFJa";

	// ???????????? ??????(??????)??? ???????????? ??????
	@PostMapping("/createToken")
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

	// Map??? ???????????? Http?????? ??????????????? ????????? ?????? ??????
	private List<NameValuePair> convertParameter(Map<String, String> paramMap) {
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		Set<Entry<String, String>> entries = paramMap.entrySet();
		for (Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	}

	// ????????????
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
			System.err.println("????????????");
			return -1;
		} else {
			System.err.println("????????????");
			return 1;
		}
	}

	// ???????????? ??????????????? ???????????? ??????????????? ???????????? ??????
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

	// ???????????? ???????????? ????????? ???????????? ??????
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
