package com.toosome.web.testController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

  @GetMapping("/admin")
  public String admin() {
    return "adminpages/index";
  }

  @GetMapping("/testsns")
  public String testSns() {
    return "testSns";
  }
  
  @GetMapping("/allbuy")  // 단체구매 페이지
  public String allBuy() {
	  return "subpages/allBuy/allBuy";
  }
  @GetMapping("/membership")   // 멤버쉽 페이지
  public String memberShip() {
	  return "subpages/memberShip/memberShip";
  }

  @GetMapping("/nutrienta")   // 영양성분표 페이지1
  public String nutrientA() {
	  return "subpages/nutrient/nutrient1";
  }
  @GetMapping("/nutrientb")   // 영양성분표 페이지2
  public String nutrientB() {
	  return "subpages/nutrient/nutrient2";
  }
  @GetMapping("/nutrientc")   // 영양성분표 페이지3
  public String nutrientC() {
	  return "subpages/nutrient/nutrient3";
  }
  @GetMapping("/nutrientd")   // 영양성분표 페이지4
  public String nutrientD() {
	  return "subpages/nutrient/nutrient4";
  }

}
