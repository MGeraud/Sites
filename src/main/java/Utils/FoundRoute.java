package Utils;

public class FoundRoute {

    private Long foundPlaceId;
    private String foundPlaceName;
    private String foundRouteType ;
    private String foundRouteName ;
    private String foundRouteGrade ;

    public FoundRoute(Long foundPlaceId, String foundPlaceName, String foundRouteType, String foundRouteName, String foundRouteGrade) {
        this.foundPlaceId = foundPlaceId;
        this.foundPlaceName = foundPlaceName;
        this.foundRouteType = foundRouteType;
        this.foundRouteName = foundRouteName;
        this.foundRouteGrade = foundRouteGrade;
    }

    public Long getFoundPlaceId() {
        return foundPlaceId;
    }

    public String getFoundPlaceName() {
        return foundPlaceName;
    }

    public String getFoundRouteType() {
        return foundRouteType;
    }

    public String getFoundRouteName() {
        return foundRouteName;
    }

    public String getFoundRouteGrade() {
        return foundRouteGrade;
    }
}
