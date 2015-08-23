package com.zsgl.web.admin;

import com.zsgl.domain.AccountType;
import com.zsgl.domain.Affirm;
import com.zsgl.domain.BadType;
import com.zsgl.domain.BankType;
import com.zsgl.domain.BaseOrder;
import com.zsgl.domain.Cases;
import com.zsgl.domain.Click;
import com.zsgl.domain.Company;
import com.zsgl.domain.CompanyAccount;
import com.zsgl.domain.DiyTour;
import com.zsgl.domain.GlobalResource;
import com.zsgl.domain.Hotel;
import com.zsgl.domain.HotelAddress;
import com.zsgl.domain.HotelLevel;
import com.zsgl.domain.HotelOrder;
import com.zsgl.domain.Link;
import com.zsgl.domain.MeetingHotel;
import com.zsgl.domain.MeetingPlace;
import com.zsgl.domain.MeetingTour;
import com.zsgl.domain.MettingService;
import com.zsgl.domain.NavMenu;
import com.zsgl.domain.OrderState;
import com.zsgl.domain.OverseasTour;
import com.zsgl.domain.OverseasTourAddress;
import com.zsgl.domain.Poster;
import com.zsgl.domain.Price;
import com.zsgl.domain.Recommend;
import com.zsgl.domain.Room;
import com.zsgl.domain.RoomState;
import com.zsgl.domain.RoomType;
import com.zsgl.domain.Scenic;
import com.zsgl.domain.ScenicAddress;
import com.zsgl.domain.Strategy;
import com.zsgl.domain.StrategyType;
import com.zsgl.domain.Strength;
import com.zsgl.domain.Tour;
import com.zsgl.domain.TourAddress;
import com.zsgl.domain.TourDay;
import com.zsgl.domain.TourOrder;
import com.zsgl.domain.TourType;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

@Configurable
/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@SuppressWarnings("deprecation")
	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		// Register application converters and formatters
	}

	public Converter<AccountType, String> getAccountTypeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.AccountType, java.lang.String>() {
            public String convert(AccountType accountType) {
                return new StringBuilder().append(accountType.getName()).toString();
            }
        };
    }

	public Converter<Long, AccountType> getIdToAccountTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.AccountType>() {
            public com.zsgl.domain.AccountType convert(java.lang.Long id) {
                return AccountType.findAccountType(id);
            }
        };
    }

	public Converter<String, AccountType> getStringToAccountTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.AccountType>() {
            public com.zsgl.domain.AccountType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), AccountType.class);
            }
        };
    }

	public Converter<Affirm, String> getAffirmToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Affirm, java.lang.String>() {
            public String convert(Affirm affirm) {
                return new StringBuilder().append(affirm.getName()).toString();
            }
        };
    }

	public Converter<Long, Affirm> getIdToAffirmConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Affirm>() {
            public com.zsgl.domain.Affirm convert(java.lang.Long id) {
                return Affirm.findAffirm(id);
            }
        };
    }

	public Converter<String, Affirm> getStringToAffirmConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Affirm>() {
            public com.zsgl.domain.Affirm convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Affirm.class);
            }
        };
    }

	public Converter<BadType, String> getBadTypeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.BadType, java.lang.String>() {
            public String convert(BadType badType) {
                return new StringBuilder().append(badType.getName()).toString();
            }
        };
    }

	public Converter<Long, BadType> getIdToBadTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.BadType>() {
            public com.zsgl.domain.BadType convert(java.lang.Long id) {
                return BadType.findBadType(id);
            }
        };
    }

	public Converter<String, BadType> getStringToBadTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.BadType>() {
            public com.zsgl.domain.BadType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), BadType.class);
            }
        };
    }

	public Converter<BankType, String> getBankTypeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.BankType, java.lang.String>() {
            public String convert(BankType bankType) {
                return new StringBuilder().append(bankType.getName()).append(" ").append(bankType.getCode()).toString();
            }
        };
    }

	public Converter<Long, BankType> getIdToBankTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.BankType>() {
            public com.zsgl.domain.BankType convert(java.lang.Long id) {
                return BankType.findBankType(id);
            }
        };
    }

	public Converter<String, BankType> getStringToBankTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.BankType>() {
            public com.zsgl.domain.BankType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), BankType.class);
            }
        };
    }

	public Converter<BaseOrder, String> getBaseOrderToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.BaseOrder, java.lang.String>() {
            public String convert(BaseOrder baseOrder) {
                return new StringBuilder().append(baseOrder.getContact()).append(" ").append(baseOrder.getSex()).append(" ").append(baseOrder.getEmail()).append(" ").append(baseOrder.getPhone()).toString();
            }
        };
    }

	public Converter<Long, BaseOrder> getIdToBaseOrderConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.BaseOrder>() {
            public com.zsgl.domain.BaseOrder convert(java.lang.Long id) {
                return BaseOrder.findBaseOrder(id);
            }
        };
    }

	public Converter<String, BaseOrder> getStringToBaseOrderConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.BaseOrder>() {
            public com.zsgl.domain.BaseOrder convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), BaseOrder.class);
            }
        };
    }

	public Converter<Cases, String> getCasesToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Cases, java.lang.String>() {
            public String convert(Cases cases) {
                return new StringBuilder().append(cases.getName()).append(" ").append(cases.getContent()).toString();
            }
        };
    }

	public Converter<Long, Cases> getIdToCasesConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Cases>() {
            public com.zsgl.domain.Cases convert(java.lang.Long id) {
                return Cases.findCases(id);
            }
        };
    }

	public Converter<String, Cases> getStringToCasesConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Cases>() {
            public com.zsgl.domain.Cases convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Cases.class);
            }
        };
    }

	public Converter<Click, String> getClickToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Click, java.lang.String>() {
            public String convert(Click click) {
                return new StringBuilder().append(click.getUpdateTime()).append(" ").append(click.getHits()).toString();
            }
        };
    }

	public Converter<Long, Click> getIdToClickConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Click>() {
            public com.zsgl.domain.Click convert(java.lang.Long id) {
                return Click.findClick(id);
            }
        };
    }

	public Converter<String, Click> getStringToClickConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Click>() {
            public com.zsgl.domain.Click convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Click.class);
            }
        };
    }

	public Converter<Company, String> getCompanyToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Company, java.lang.String>() {
            public String convert(Company company) {
                return new StringBuilder().append(company.getContent()).toString();
            }
        };
    }

	public Converter<Long, Company> getIdToCompanyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Company>() {
            public com.zsgl.domain.Company convert(java.lang.Long id) {
                return Company.findCompany(id);
            }
        };
    }

	public Converter<String, Company> getStringToCompanyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Company>() {
            public com.zsgl.domain.Company convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Company.class);
            }
        };
    }

	public Converter<CompanyAccount, String> getCompanyAccountToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.CompanyAccount, java.lang.String>() {
            public String convert(CompanyAccount companyAccount) {
                return new StringBuilder().append(companyAccount.getName()).append(" ").append(companyAccount.getCardid()).append(" ").append(companyAccount.getBank()).append(" ").append(companyAccount.getImage()).toString();
            }
        };
    }

	public Converter<Long, CompanyAccount> getIdToCompanyAccountConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.CompanyAccount>() {
            public com.zsgl.domain.CompanyAccount convert(java.lang.Long id) {
                return CompanyAccount.findCompanyAccount(id);
            }
        };
    }

	public Converter<String, CompanyAccount> getStringToCompanyAccountConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.CompanyAccount>() {
            public com.zsgl.domain.CompanyAccount convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), CompanyAccount.class);
            }
        };
    }

	public Converter<DiyTour, String> getDiyTourToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.DiyTour, java.lang.String>() {
            public String convert(DiyTour diyTour) {
                return new StringBuilder().append(diyTour.getName()).append(" ").append(diyTour.getDoorPrice()).append(" ").append(diyTour.getPrivilege()).append(" ").append(diyTour.getChildren()).toString();
            }
        };
    }

	public Converter<Long, DiyTour> getIdToDiyTourConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.DiyTour>() {
            public com.zsgl.domain.DiyTour convert(java.lang.Long id) {
                return DiyTour.findDiyTour(id);
            }
        };
    }

	public Converter<String, DiyTour> getStringToDiyTourConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.DiyTour>() {
            public com.zsgl.domain.DiyTour convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), DiyTour.class);
            }
        };
    }

	public Converter<GlobalResource, String> getGlobalResourceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.GlobalResource, java.lang.String>() {
            public String convert(GlobalResource globalResource) {
                return new StringBuilder().append(globalResource.getTitle()).append(" ").append(globalResource.getLogo()).append(" ").append(globalResource.getSeo()).append(" ").append(globalResource.getFoot()).toString();
            }
        };
    }

	public Converter<Long, GlobalResource> getIdToGlobalResourceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.GlobalResource>() {
            public com.zsgl.domain.GlobalResource convert(java.lang.Long id) {
                return GlobalResource.findGlobalResource(id);
            }
        };
    }

	public Converter<String, GlobalResource> getStringToGlobalResourceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.GlobalResource>() {
            public com.zsgl.domain.GlobalResource convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), GlobalResource.class);
            }
        };
    }

	public Converter<Hotel, String> getHotelToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Hotel, java.lang.String>() {
            public String convert(Hotel hotel) {
                return new StringBuilder().append(hotel.getName()).append(" ").append(hotel.getImage()).append(" ").append(hotel.getLocation()).append(" ").append(hotel.getAttractons()).toString();
            }
        };
    }

	public Converter<Long, Hotel> getIdToHotelConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Hotel>() {
            public com.zsgl.domain.Hotel convert(java.lang.Long id) {
                return Hotel.findHotel(id);
            }
        };
    }

	public Converter<String, Hotel> getStringToHotelConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Hotel>() {
            public com.zsgl.domain.Hotel convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Hotel.class);
            }
        };
    }

	public Converter<HotelAddress, String> getHotelAddressToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.HotelAddress, java.lang.String>() {
            public String convert(HotelAddress hotelAddress) {
                return new StringBuilder().append(hotelAddress.getName()).toString();
            }
        };
    }

	public Converter<Long, HotelAddress> getIdToHotelAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.HotelAddress>() {
            public com.zsgl.domain.HotelAddress convert(java.lang.Long id) {
                return HotelAddress.findHotelAddress(id);
            }
        };
    }

	public Converter<String, HotelAddress> getStringToHotelAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.HotelAddress>() {
            public com.zsgl.domain.HotelAddress convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), HotelAddress.class);
            }
        };
    }

	public Converter<HotelLevel, String> getHotelLevelToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.HotelLevel, java.lang.String>() {
            public String convert(HotelLevel hotelLevel) {
                return new StringBuilder().append(hotelLevel.getName()).toString();
            }
        };
    }

	public Converter<Long, HotelLevel> getIdToHotelLevelConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.HotelLevel>() {
            public com.zsgl.domain.HotelLevel convert(java.lang.Long id) {
                return HotelLevel.findHotelLevel(id);
            }
        };
    }

	public Converter<String, HotelLevel> getStringToHotelLevelConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.HotelLevel>() {
            public com.zsgl.domain.HotelLevel convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), HotelLevel.class);
            }
        };
    }

	public Converter<HotelOrder, String> getHotelOrderToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.HotelOrder, java.lang.String>() {
            public String convert(HotelOrder hotelOrder) {
                return new StringBuilder().append(hotelOrder.getContact()).append(" ").append(hotelOrder.getSex()).append(" ").append(hotelOrder.getEmail()).append(" ").append(hotelOrder.getPhone()).toString();
            }
        };
    }

	public Converter<Long, HotelOrder> getIdToHotelOrderConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.HotelOrder>() {
            public com.zsgl.domain.HotelOrder convert(java.lang.Long id) {
                return HotelOrder.findHotelOrder(id);
            }
        };
    }

	public Converter<String, HotelOrder> getStringToHotelOrderConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.HotelOrder>() {
            public com.zsgl.domain.HotelOrder convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), HotelOrder.class);
            }
        };
    }

	public Converter<Link, String> getLinkToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Link, java.lang.String>() {
            public String convert(Link link) {
                return new StringBuilder().append(link.getName()).append(" ").append(link.getAddress()).toString();
            }
        };
    }

	public Converter<Long, Link> getIdToLinkConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Link>() {
            public com.zsgl.domain.Link convert(java.lang.Long id) {
                return Link.findLink(id);
            }
        };
    }

	public Converter<String, Link> getStringToLinkConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Link>() {
            public com.zsgl.domain.Link convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Link.class);
            }
        };
    }

	public Converter<MeetingHotel, String> getMeetingHotelToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.MeetingHotel, java.lang.String>() {
            public String convert(MeetingHotel meetingHotel) {
                return new StringBuilder().append(meetingHotel.getName()).append(" ").append(meetingHotel.getImage()).append(" ").append(meetingHotel.getLocation()).append(" ").append(meetingHotel.getAttractons()).toString();
            }
        };
    }

	public Converter<Long, MeetingHotel> getIdToMeetingHotelConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.MeetingHotel>() {
            public com.zsgl.domain.MeetingHotel convert(java.lang.Long id) {
                return MeetingHotel.findMeetingHotel(id);
            }
        };
    }

	public Converter<String, MeetingHotel> getStringToMeetingHotelConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.MeetingHotel>() {
            public com.zsgl.domain.MeetingHotel convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), MeetingHotel.class);
            }
        };
    }

	public Converter<MeetingPlace, String> getMeetingPlaceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.MeetingPlace, java.lang.String>() {
            public String convert(MeetingPlace meetingPlace) {
                return new StringBuilder().append(meetingPlace.getName()).append(" ").append(meetingPlace.getImage()).append(" ").append(meetingPlace.getContent()).toString();
            }
        };
    }

	public Converter<Long, MeetingPlace> getIdToMeetingPlaceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.MeetingPlace>() {
            public com.zsgl.domain.MeetingPlace convert(java.lang.Long id) {
                return MeetingPlace.findMeetingPlace(id);
            }
        };
    }

	public Converter<String, MeetingPlace> getStringToMeetingPlaceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.MeetingPlace>() {
            public com.zsgl.domain.MeetingPlace convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), MeetingPlace.class);
            }
        };
    }

	public Converter<MeetingTour, String> getMeetingTourToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.MeetingTour, java.lang.String>() {
            public String convert(MeetingTour meetingTour) {
                return new StringBuilder().append(meetingTour.getName()).append(" ").append(meetingTour.getDoorPrice()).append(" ").append(meetingTour.getPrivilege()).append(" ").append(meetingTour.getChildren()).toString();
            }
        };
    }

	public Converter<Long, MeetingTour> getIdToMeetingTourConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.MeetingTour>() {
            public com.zsgl.domain.MeetingTour convert(java.lang.Long id) {
                return MeetingTour.findMeetingTour(id);
            }
        };
    }

	public Converter<String, MeetingTour> getStringToMeetingTourConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.MeetingTour>() {
            public com.zsgl.domain.MeetingTour convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), MeetingTour.class);
            }
        };
    }

	public Converter<MettingService, String> getMettingServiceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.MettingService, java.lang.String>() {
            public String convert(MettingService mettingService) {
                return new StringBuilder().append(mettingService.getContent()).toString();
            }
        };
    }

	public Converter<Long, MettingService> getIdToMettingServiceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.MettingService>() {
            public com.zsgl.domain.MettingService convert(java.lang.Long id) {
                return MettingService.findMettingService(id);
            }
        };
    }

	public Converter<String, MettingService> getStringToMettingServiceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.MettingService>() {
            public com.zsgl.domain.MettingService convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), MettingService.class);
            }
        };
    }

	public Converter<NavMenu, String> getNavMenuToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.NavMenu, java.lang.String>() {
            public String convert(NavMenu navMenu) {
                return new StringBuilder().append(navMenu.getName()).append(" ").append(navMenu.getAddress()).append(" ").append(navMenu.getImage()).toString();
            }
        };
    }

	public Converter<Long, NavMenu> getIdToNavMenuConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.NavMenu>() {
            public com.zsgl.domain.NavMenu convert(java.lang.Long id) {
                return NavMenu.findNavMenu(id);
            }
        };
    }

	public Converter<String, NavMenu> getStringToNavMenuConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.NavMenu>() {
            public com.zsgl.domain.NavMenu convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), NavMenu.class);
            }
        };
    }

	public Converter<OrderState, String> getOrderStateToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.OrderState, java.lang.String>() {
            public String convert(OrderState orderState) {
                return new StringBuilder().append(orderState.getName()).toString();
            }
        };
    }

	public Converter<Long, OrderState> getIdToOrderStateConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.OrderState>() {
            public com.zsgl.domain.OrderState convert(java.lang.Long id) {
                return OrderState.findOrderState(id);
            }
        };
    }

	public Converter<String, OrderState> getStringToOrderStateConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.OrderState>() {
            public com.zsgl.domain.OrderState convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), OrderState.class);
            }
        };
    }

	public Converter<OverseasTour, String> getOverseasTourToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.OverseasTour, java.lang.String>() {
            public String convert(OverseasTour overseasTour) {
                return new StringBuilder().append(overseasTour.getName()).append(" ").append(overseasTour.getDoorPrice()).append(" ").append(overseasTour.getPrivilege()).append(" ").append(overseasTour.getChildren()).toString();
            }
        };
    }

	public Converter<Long, OverseasTour> getIdToOverseasTourConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.OverseasTour>() {
            public com.zsgl.domain.OverseasTour convert(java.lang.Long id) {
                return OverseasTour.findOverseasTour(id);
            }
        };
    }

	public Converter<String, OverseasTour> getStringToOverseasTourConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.OverseasTour>() {
            public com.zsgl.domain.OverseasTour convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), OverseasTour.class);
            }
        };
    }

	public Converter<OverseasTourAddress, String> getOverseasTourAddressToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.OverseasTourAddress, java.lang.String>() {
            public String convert(OverseasTourAddress overseasTourAddress) {
                return new StringBuilder().append(overseasTourAddress.getName()).toString();
            }
        };
    }

	public Converter<Long, OverseasTourAddress> getIdToOverseasTourAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.OverseasTourAddress>() {
            public com.zsgl.domain.OverseasTourAddress convert(java.lang.Long id) {
                return OverseasTourAddress.findOverseasTourAddress(id);
            }
        };
    }

	public Converter<String, OverseasTourAddress> getStringToOverseasTourAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.OverseasTourAddress>() {
            public com.zsgl.domain.OverseasTourAddress convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), OverseasTourAddress.class);
            }
        };
    }

	public Converter<Poster, String> getPosterToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Poster, java.lang.String>() {
            public String convert(Poster poster) {
                return new StringBuilder().append(poster.getImage()).append(" ").append(poster.getAddress()).toString();
            }
        };
    }

	public Converter<Long, Poster> getIdToPosterConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Poster>() {
            public com.zsgl.domain.Poster convert(java.lang.Long id) {
                return Poster.findPoster(id);
            }
        };
    }

	public Converter<String, Poster> getStringToPosterConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Poster>() {
            public com.zsgl.domain.Poster convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Poster.class);
            }
        };
    }

	public Converter<Price, String> getPriceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Price, java.lang.String>() {
            public String convert(Price price) {
                return new StringBuilder().append(price.getDate()).append(" ").append(price.getPrice()).toString();
            }
        };
    }

	public Converter<Long, Price> getIdToPriceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Price>() {
            public com.zsgl.domain.Price convert(java.lang.Long id) {
                return Price.findPrice(id);
            }
        };
    }

	public Converter<String, Price> getStringToPriceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Price>() {
            public com.zsgl.domain.Price convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Price.class);
            }
        };
    }

	public Converter<Recommend, String> getRecommendToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Recommend, java.lang.String>() {
            public String convert(Recommend recommend) {
                return new StringBuilder().append(recommend.getName()).toString();
            }
        };
    }

	public Converter<Long, Recommend> getIdToRecommendConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Recommend>() {
            public com.zsgl.domain.Recommend convert(java.lang.Long id) {
                return Recommend.findRecommend(id);
            }
        };
    }

	public Converter<String, Recommend> getStringToRecommendConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Recommend>() {
            public com.zsgl.domain.Recommend convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Recommend.class);
            }
        };
    }

	public Converter<Room, String> getRoomToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Room, java.lang.String>() {
            public String convert(Room room) {
                return new StringBuilder().append(room.getName()).append(" ").append(room.getDoorPrice()).append(" ").append(room.getType()).append(" ").append(room.getBad()).toString();
            }
        };
    }

	public Converter<Long, Room> getIdToRoomConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Room>() {
            public com.zsgl.domain.Room convert(java.lang.Long id) {
                return Room.findRoom(id);
            }
        };
    }

	public Converter<String, Room> getStringToRoomConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Room>() {
            public com.zsgl.domain.Room convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Room.class);
            }
        };
    }

	public Converter<RoomState, String> getRoomStateToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.RoomState, java.lang.String>() {
            public String convert(RoomState roomState) {
                return new StringBuilder().append(roomState.getName()).toString();
            }
        };
    }

	public Converter<Long, RoomState> getIdToRoomStateConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.RoomState>() {
            public com.zsgl.domain.RoomState convert(java.lang.Long id) {
                return RoomState.findRoomState(id);
            }
        };
    }

	public Converter<String, RoomState> getStringToRoomStateConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.RoomState>() {
            public com.zsgl.domain.RoomState convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), RoomState.class);
            }
        };
    }

	public Converter<RoomType, String> getRoomTypeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.RoomType, java.lang.String>() {
            public String convert(RoomType roomType) {
                return new StringBuilder().append(roomType.getName()).toString();
            }
        };
    }

	public Converter<Long, RoomType> getIdToRoomTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.RoomType>() {
            public com.zsgl.domain.RoomType convert(java.lang.Long id) {
                return RoomType.findRoomType(id);
            }
        };
    }

	public Converter<String, RoomType> getStringToRoomTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.RoomType>() {
            public com.zsgl.domain.RoomType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), RoomType.class);
            }
        };
    }

	public Converter<Scenic, String> getScenicToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Scenic, java.lang.String>() {
            public String convert(Scenic scenic) {
                return new StringBuilder().append(scenic.getName()).append(" ").append(scenic.getImage()).append(" ").append(scenic.getDoorPrice()).append(" ").append(scenic.getContent()).toString();
            }
        };
    }

	public Converter<Long, Scenic> getIdToScenicConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Scenic>() {
            public com.zsgl.domain.Scenic convert(java.lang.Long id) {
                return Scenic.findScenic(id);
            }
        };
    }

	public Converter<String, Scenic> getStringToScenicConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Scenic>() {
            public com.zsgl.domain.Scenic convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Scenic.class);
            }
        };
    }

	public Converter<ScenicAddress, String> getScenicAddressToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.ScenicAddress, java.lang.String>() {
            public String convert(ScenicAddress scenicAddress) {
                return new StringBuilder().append(scenicAddress.getName()).toString();
            }
        };
    }

	public Converter<Long, ScenicAddress> getIdToScenicAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.ScenicAddress>() {
            public com.zsgl.domain.ScenicAddress convert(java.lang.Long id) {
                return ScenicAddress.findScenicAddress(id);
            }
        };
    }

	public Converter<String, ScenicAddress> getStringToScenicAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.ScenicAddress>() {
            public com.zsgl.domain.ScenicAddress convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ScenicAddress.class);
            }
        };
    }

	public Converter<Strategy, String> getStrategyToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Strategy, java.lang.String>() {
            public String convert(Strategy strategy) {
                return new StringBuilder().append(strategy.getName()).append(" ").append(strategy.getUpdateTime()).append(" ").append(strategy.getContent()).toString();
            }
        };
    }

	public Converter<Long, Strategy> getIdToStrategyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Strategy>() {
            public com.zsgl.domain.Strategy convert(java.lang.Long id) {
                return Strategy.findStrategy(id);
            }
        };
    }

	public Converter<String, Strategy> getStringToStrategyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Strategy>() {
            public com.zsgl.domain.Strategy convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Strategy.class);
            }
        };
    }

	public Converter<StrategyType, String> getStrategyTypeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.StrategyType, java.lang.String>() {
            public String convert(StrategyType strategyType) {
                return new StringBuilder().append(strategyType.getName()).toString();
            }
        };
    }

	public Converter<Long, StrategyType> getIdToStrategyTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.StrategyType>() {
            public com.zsgl.domain.StrategyType convert(java.lang.Long id) {
                return StrategyType.findStrategyType(id);
            }
        };
    }

	public Converter<String, StrategyType> getStringToStrategyTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.StrategyType>() {
            public com.zsgl.domain.StrategyType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), StrategyType.class);
            }
        };
    }

	public Converter<Strength, String> getStrengthToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Strength, java.lang.String>() {
            public String convert(Strength strength) {
                return new StringBuilder().append(strength.getName()).toString();
            }
        };
    }

	public Converter<Long, Strength> getIdToStrengthConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Strength>() {
            public com.zsgl.domain.Strength convert(java.lang.Long id) {
                return Strength.findStrength(id);
            }
        };
    }

	public Converter<String, Strength> getStringToStrengthConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Strength>() {
            public com.zsgl.domain.Strength convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Strength.class);
            }
        };
    }

	public Converter<Tour, String> getTourToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.Tour, java.lang.String>() {
            public String convert(Tour tour) {
                return new StringBuilder().append(tour.getName()).append(" ").append(tour.getDoorPrice()).append(" ").append(tour.getPrivilege()).append(" ").append(tour.getChildren()).toString();
            }
        };
    }

	public Converter<Long, Tour> getIdToTourConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.Tour>() {
            public com.zsgl.domain.Tour convert(java.lang.Long id) {
                return Tour.findTour(id);
            }
        };
    }

	public Converter<String, Tour> getStringToTourConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.Tour>() {
            public com.zsgl.domain.Tour convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Tour.class);
            }
        };
    }

	public Converter<TourAddress, String> getTourAddressToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.TourAddress, java.lang.String>() {
            public String convert(TourAddress tourAddress) {
                return new StringBuilder().append(tourAddress.getName()).toString();
            }
        };
    }

	public Converter<Long, TourAddress> getIdToTourAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.TourAddress>() {
            public com.zsgl.domain.TourAddress convert(java.lang.Long id) {
                return TourAddress.findTourAddress(id);
            }
        };
    }

	public Converter<String, TourAddress> getStringToTourAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.TourAddress>() {
            public com.zsgl.domain.TourAddress convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), TourAddress.class);
            }
        };
    }

	public Converter<TourDay, String> getTourDayToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.TourDay, java.lang.String>() {
            public String convert(TourDay tourDay) {
                return new StringBuilder().append(tourDay.getName()).toString();
            }
        };
    }

	public Converter<Long, TourDay> getIdToTourDayConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.TourDay>() {
            public com.zsgl.domain.TourDay convert(java.lang.Long id) {
                return TourDay.findTourDay(id);
            }
        };
    }

	public Converter<String, TourDay> getStringToTourDayConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.TourDay>() {
            public com.zsgl.domain.TourDay convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), TourDay.class);
            }
        };
    }

	public Converter<TourOrder, String> getTourOrderToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.TourOrder, java.lang.String>() {
            public String convert(TourOrder tourOrder) {
                return new StringBuilder().append(tourOrder.getContact()).append(" ").append(tourOrder.getSex()).append(" ").append(tourOrder.getEmail()).append(" ").append(tourOrder.getPhone()).toString();
            }
        };
    }

	public Converter<Long, TourOrder> getIdToTourOrderConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.TourOrder>() {
            public com.zsgl.domain.TourOrder convert(java.lang.Long id) {
                return TourOrder.findTourOrder(id);
            }
        };
    }

	public Converter<String, TourOrder> getStringToTourOrderConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.TourOrder>() {
            public com.zsgl.domain.TourOrder convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), TourOrder.class);
            }
        };
    }

	public Converter<TourType, String> getTourTypeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.zsgl.domain.TourType, java.lang.String>() {
            public String convert(TourType tourType) {
                return new StringBuilder().append(tourType.getName()).toString();
            }
        };
    }

	public Converter<Long, TourType> getIdToTourTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.zsgl.domain.TourType>() {
            public com.zsgl.domain.TourType convert(java.lang.Long id) {
                return TourType.findTourType(id);
            }
        };
    }

	public Converter<String, TourType> getStringToTourTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.zsgl.domain.TourType>() {
            public com.zsgl.domain.TourType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), TourType.class);
            }
        };
    }

	public void installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getAccountTypeToStringConverter());
        registry.addConverter(getIdToAccountTypeConverter());
        registry.addConverter(getStringToAccountTypeConverter());
        registry.addConverter(getAffirmToStringConverter());
        registry.addConverter(getIdToAffirmConverter());
        registry.addConverter(getStringToAffirmConverter());
        registry.addConverter(getBadTypeToStringConverter());
        registry.addConverter(getIdToBadTypeConverter());
        registry.addConverter(getStringToBadTypeConverter());
        registry.addConverter(getBankTypeToStringConverter());
        registry.addConverter(getIdToBankTypeConverter());
        registry.addConverter(getStringToBankTypeConverter());
        registry.addConverter(getBaseOrderToStringConverter());
        registry.addConverter(getIdToBaseOrderConverter());
        registry.addConverter(getStringToBaseOrderConverter());
        registry.addConverter(getCasesToStringConverter());
        registry.addConverter(getIdToCasesConverter());
        registry.addConverter(getStringToCasesConverter());
        registry.addConverter(getClickToStringConverter());
        registry.addConverter(getIdToClickConverter());
        registry.addConverter(getStringToClickConverter());
        registry.addConverter(getCompanyToStringConverter());
        registry.addConverter(getIdToCompanyConverter());
        registry.addConverter(getStringToCompanyConverter());
        registry.addConverter(getCompanyAccountToStringConverter());
        registry.addConverter(getIdToCompanyAccountConverter());
        registry.addConverter(getStringToCompanyAccountConverter());
        registry.addConverter(getDiyTourToStringConverter());
        registry.addConverter(getIdToDiyTourConverter());
        registry.addConverter(getStringToDiyTourConverter());
        registry.addConverter(getGlobalResourceToStringConverter());
        registry.addConverter(getIdToGlobalResourceConverter());
        registry.addConverter(getStringToGlobalResourceConverter());
        registry.addConverter(getHotelToStringConverter());
        registry.addConverter(getIdToHotelConverter());
        registry.addConverter(getStringToHotelConverter());
        registry.addConverter(getHotelAddressToStringConverter());
        registry.addConverter(getIdToHotelAddressConverter());
        registry.addConverter(getStringToHotelAddressConverter());
        registry.addConverter(getHotelLevelToStringConverter());
        registry.addConverter(getIdToHotelLevelConverter());
        registry.addConverter(getStringToHotelLevelConverter());
        registry.addConverter(getHotelOrderToStringConverter());
        registry.addConverter(getIdToHotelOrderConverter());
        registry.addConverter(getStringToHotelOrderConverter());
        registry.addConverter(getLinkToStringConverter());
        registry.addConverter(getIdToLinkConverter());
        registry.addConverter(getStringToLinkConverter());
        registry.addConverter(getMeetingHotelToStringConverter());
        registry.addConverter(getIdToMeetingHotelConverter());
        registry.addConverter(getStringToMeetingHotelConverter());
        registry.addConverter(getMeetingPlaceToStringConverter());
        registry.addConverter(getIdToMeetingPlaceConverter());
        registry.addConverter(getStringToMeetingPlaceConverter());
        registry.addConverter(getMeetingTourToStringConverter());
        registry.addConverter(getIdToMeetingTourConverter());
        registry.addConverter(getStringToMeetingTourConverter());
        registry.addConverter(getMettingServiceToStringConverter());
        registry.addConverter(getIdToMettingServiceConverter());
        registry.addConverter(getStringToMettingServiceConverter());
        registry.addConverter(getNavMenuToStringConverter());
        registry.addConverter(getIdToNavMenuConverter());
        registry.addConverter(getStringToNavMenuConverter());
        registry.addConverter(getOrderStateToStringConverter());
        registry.addConverter(getIdToOrderStateConverter());
        registry.addConverter(getStringToOrderStateConverter());
        registry.addConverter(getOverseasTourToStringConverter());
        registry.addConverter(getIdToOverseasTourConverter());
        registry.addConverter(getStringToOverseasTourConverter());
        registry.addConverter(getOverseasTourAddressToStringConverter());
        registry.addConverter(getIdToOverseasTourAddressConverter());
        registry.addConverter(getStringToOverseasTourAddressConverter());
        registry.addConverter(getPosterToStringConverter());
        registry.addConverter(getIdToPosterConverter());
        registry.addConverter(getStringToPosterConverter());
        registry.addConverter(getPriceToStringConverter());
        registry.addConverter(getIdToPriceConverter());
        registry.addConverter(getStringToPriceConverter());
        registry.addConverter(getRecommendToStringConverter());
        registry.addConverter(getIdToRecommendConverter());
        registry.addConverter(getStringToRecommendConverter());
        registry.addConverter(getRoomToStringConverter());
        registry.addConverter(getIdToRoomConverter());
        registry.addConverter(getStringToRoomConverter());
        registry.addConverter(getRoomStateToStringConverter());
        registry.addConverter(getIdToRoomStateConverter());
        registry.addConverter(getStringToRoomStateConverter());
        registry.addConverter(getRoomTypeToStringConverter());
        registry.addConverter(getIdToRoomTypeConverter());
        registry.addConverter(getStringToRoomTypeConverter());
        registry.addConverter(getScenicToStringConverter());
        registry.addConverter(getIdToScenicConverter());
        registry.addConverter(getStringToScenicConverter());
        registry.addConverter(getScenicAddressToStringConverter());
        registry.addConverter(getIdToScenicAddressConverter());
        registry.addConverter(getStringToScenicAddressConverter());
        registry.addConverter(getStrategyToStringConverter());
        registry.addConverter(getIdToStrategyConverter());
        registry.addConverter(getStringToStrategyConverter());
        registry.addConverter(getStrategyTypeToStringConverter());
        registry.addConverter(getIdToStrategyTypeConverter());
        registry.addConverter(getStringToStrategyTypeConverter());
        registry.addConverter(getStrengthToStringConverter());
        registry.addConverter(getIdToStrengthConverter());
        registry.addConverter(getStringToStrengthConverter());
        registry.addConverter(getTourToStringConverter());
        registry.addConverter(getIdToTourConverter());
        registry.addConverter(getStringToTourConverter());
        registry.addConverter(getTourAddressToStringConverter());
        registry.addConverter(getIdToTourAddressConverter());
        registry.addConverter(getStringToTourAddressConverter());
        registry.addConverter(getTourDayToStringConverter());
        registry.addConverter(getIdToTourDayConverter());
        registry.addConverter(getStringToTourDayConverter());
        registry.addConverter(getTourOrderToStringConverter());
        registry.addConverter(getIdToTourOrderConverter());
        registry.addConverter(getStringToTourOrderConverter());
        registry.addConverter(getTourTypeToStringConverter());
        registry.addConverter(getIdToTourTypeConverter());
        registry.addConverter(getStringToTourTypeConverter());
    }

	public void afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
}
