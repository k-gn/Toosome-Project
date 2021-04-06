// responsive sidebar start ---------------------------------

var mobile_menu_visible = 0,
  mobile_menu_initialized = false,
  toggle_initialized = false,
  bootstrap_nav_initialized = false;


$(document).ready(function() {

  $('body').bootstrapMaterialDesign();

  $sidebar = $('.sidebar');

  md.initSidebarsCheck();

  window_width = $(window).width();

	$(document).on('click', '.navbar-toggler', function() {
	  $toggle = $(this);
	
	  if (mobile_menu_visible == 1) {
	    $('html').removeClass('nav-open');
	
	    $('.close-layer').remove();
	    setTimeout(function() {
	      $toggle.removeClass('toggled');
	    }, 400);
	
	    mobile_menu_visible = 0;
	  } else {
	    setTimeout(function() {
	      $toggle.addClass('toggled');
	    }, 430);
	
	    var $layer = $('<div class="close-layer"></div>');
	
	    if ($('body').find('.main-panel').length != 0) {
	      $layer.appendTo(".main-panel");
	
	    } else if (($('body').hasClass('off-canvas-sidebar'))) {
	      $layer.appendTo(".wrapper-full-page");
	    }
	
	    setTimeout(function() {
	      $layer.addClass('visible');
	    }, 100);
	
	    $layer.click(function() {
	      $('html').removeClass('nav-open');
	      mobile_menu_visible = 0;
	
	      $layer.removeClass('visible');
	
	      setTimeout(function() {
	        $layer.remove();
	        $toggle.removeClass('toggled');
	
	      }, 400);
	    });
	
	    $('html').addClass('nav-open');
	    mobile_menu_visible = 1;
	  }
	});
	
	// // sidebar subNav accordion event hook
	subNavs.forEach((subNav) => {
	subNav.addEventListener('click', () => navHandler(subNav));	
	});
});

// activate collapse right menu when the windows is resized
$(window).resize(function () {
  md.initSidebarsCheck();
});

md = {
  misc: {
    navbar_menu_visible: 0,
    active_collapse: true,
    disabled_collapse_init: 0,
  },
  
  initSidebarsCheck: function () {
    if ($(window).width() <= 991) {
      if ($sidebar.length != 0) {
        md.initRightMenu();
      }
    }
  },

  initRightMenu: debounce(function () {
    $sidebar_wrapper = $('.sidebar-wrapper');

    if (!mobile_menu_initialized) {
      $navbar = $('nav').find('.navbar-collapse').children('.navbar-nav');

      mobile_menu_content = '';

      nav_content = $navbar.html();

      nav_content =
        '<ul class="nav navbar-nav nav-mobile-menu">' + nav_content + '</ul>';


      $sidebar_nav = $sidebar_wrapper.find(' > .nav');

      // insert the navbar form before the sidebar list
      $nav_content = $(nav_content);
      $nav_content.insertBefore($sidebar_nav);

      $('.sidebar-wrapper .dropdown .dropdown-menu > li > a').click(function (
        event
      ) {
        event.stopPropagation();
      });

      // simulate resize so all the charts/maps will be redrawn
      window.dispatchEvent(new Event('resize'));

      mobile_menu_initialized = true;
    } else {
      if ($(window).width() > 991) {
        // reset all the additions that we made for the sidebar wrapper only if the screen is bigger than 991px
        $sidebar_wrapper.find('.nav-mobile-menu').remove();

        mobile_menu_initialized = false;
      }
    }
  }, 200),
};

function debounce(func, wait, immediate) {
  var timeout;
  return function () {
    var context = this,
      args = arguments;
    clearTimeout(timeout);
    timeout = setTimeout(function () {
      timeout = null;
      if (!immediate) func.apply(context, args);
    }, wait);
    if (immediate && !timeout) func.apply(context, args);
  };
};

// responsive sidebar end -------------------------------------------

// sidebar subNav accordion start ------------------------------------

const subNavs = document.querySelectorAll('.nav-item'); // 네비 아이템
const childNavs = document.querySelectorAll('.sub-nav'); // 아코디언 아이템

// active 초기화
const navInit = () => {
	subNavs.forEach(subNav => {
		subNav.classList.remove('active');
	});
};
// 아코디언 초기화
const childInit = () => {
	childNavs.forEach(child => {
		child.classList.remove('display');
	});
};
// 네비 버튼 핸들러
const navHandler = (subNav) => {
	navInit();
	childInit();
	subNav.classList.add('active');
	subNav.childNodes[3].classList.add('display');
};

// sidebar subNav accordion end ------------------------------------