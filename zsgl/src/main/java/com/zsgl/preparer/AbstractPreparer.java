package com.zsgl.preparer;

import java.util.Map;

import org.apache.tiles.AttributeContext;
import org.apache.tiles.context.TilesRequestContext;
import org.apache.tiles.preparer.ViewPreparer;

import com.zsgl.domain.AccountType;
import com.zsgl.domain.BaseOrder;
import com.zsgl.domain.Company;
import com.zsgl.domain.GlobalResource;
import com.zsgl.domain.Hotel;
import com.zsgl.domain.HotelAddress;
import com.zsgl.domain.HotelLevel;
import com.zsgl.domain.Link;
import com.zsgl.domain.NavMenu;
import com.zsgl.domain.OverseasTourAddress;
import com.zsgl.domain.ScenicAddress;
import com.zsgl.domain.Tour;
import com.zsgl.domain.TourAddress;
import com.zsgl.domain.TourDay;
import com.zsgl.domain.TourOrder;
import com.zsgl.domain.TourType;

public abstract class AbstractPreparer implements ViewPreparer {

	@Override
	public void execute(TilesRequestContext tilesContext,
			AttributeContext attributeContext) {
		/*
		Map<String, Object> model = tilesContext.getRequestScope();
		fillGlobalResource(model);
		fillLink(model);
		action(model);
		*/
	}

	protected abstract void action(Map<String, Object> model);
	
	/**
	 * 填充全局信息，网站标题，底部信息，logo，静态图片，等等
	 * @param model
	 */
	public static void fillGlobalResource(Map<String, Object> model) {
		if (GlobalResource.countGlobalResources() > 0) {
			model.put("globalResource", GlobalResource.findGlobalResourceEntries(0, 1).get(0));
		}
	}
	
	/**
	 * 填充关于
	 * @param model
	 */
	public static void fillAbout(Map<String, Object> model) {
		Company company = null;
		if(Company.countCompanys() > 0) {
			company = Company.findCompanyEntries(0, 1).get(0);
		}
		model.put("company", company);
	}
	
	/**
	 * 填充快速导航
	 * @param model
	 */
	public static void fillLxdh(Map<String, Object> model) {
		model.put("tourAddress", TourAddress.findAllTourAddresses());
		model.put("tourTypes", TourType.findAllTourTypes());
		model.put("tourDays", TourDay.findAllTourDays());
		model.put("hotelAddress", HotelAddress.findAllHotelAddresses());
		model.put("hotelLevels", HotelLevel.findAllHotelLevels());
	}
	
	/**
	 * 填充推荐路线
	 * @param model
	 */
	public static void fillTjlx(Map<String, Object> model) {
		model.put("ctours", Tour.findByRecommend(0, 10));
		model.put("chotels", Hotel.findByRecommend(0, 10));
	}
	
	/**
	 * 填充订单
	 * @param model
	 */
	public static void fillOrder(Map<String, Object> model) {
		model.put("orders", BaseOrder.getSortOrders(0, 10, TourOrder.class));
	}
	
	/**
	 * 填充快速导航
	 * @param model
	 */
	public static void fillKsdh(Map<String, Object> model) {
		model.put("navMenus", NavMenu.findAllNavMenus());
	}
	
	/**
	 * 填充旅游搜索
	 * @param model
	 */
	public static void fillSearch(Map<String, Object> model) {
		model.put("tourAddress", TourAddress.findAllTourAddresses());
	}
	
	/**
	 * 填充旅游搜索
	 * @param model
	 */
	public static void fillJdss(Map<String, Object> model) {
		model.put("tourAddress", TourAddress.findAllTourAddresses());
	}
	
	/**
	 * 填充友情链接
	 * @param model
	 */
	public static void fillLink(Map<String, Object> model) {
		model.put("links", Link.findAllLinks());
	}
	
	/**
	 * 填充账号类型
	 * @param model
	 */
	public static void fillAccountType(Map<String, Object> model) {
		model.put("accountTypes", AccountType.findAllAccountTypes());
	}
	
	/**
	 * 填充景点地址
	 * @param model
	 */
	public static void fillScenicAddress(Map<String, Object> model) {
		model.put("scenicAddresses", ScenicAddress.findAllScenicAddresses());
	}
	
	/**
	 * 填充境外城市
	 * @param model
	 */
	public static void fillOverseasCity(Map<String, Object> model) {
		model.put("overseasCitys", OverseasTourAddress.findAllOverseasTourAddresses());
	}
}
