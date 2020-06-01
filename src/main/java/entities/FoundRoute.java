package entities;

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

    public void setFoundPlaceId(Long foundPlaceId) {
        this.foundPlaceId = foundPlaceId;
    }

    public String getFoundPlaceName() {
        return foundPlaceName;
    }

    public void setFoundPlaceName(String foundPlaceName) {
        this.foundPlaceName = foundPlaceName;
    }

    public String getFoundRouteType() {
        return foundRouteType;
    }

    public void setFoundRouteType(String foundRouteType) {
        this.foundRouteType = foundRouteType;
    }

    public String getFoundRouteName() {
        return foundRouteName;
    }

    public void setFoundRouteName(String foundRouteName) {
        this.foundRouteName = foundRouteName;
    }

    public String getFoundRouteGrade() {
        return foundRouteGrade;
    }

    public void setFoundRouteGrade(String foundRouteGrade) {
        this.foundRouteGrade = foundRouteGrade;
    }
}
