package entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
public class Place implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long placeId;
    private String placeName;
    private boolean tag;
    @Enumerated(EnumType.STRING)
    private  Region region;
    @Lob
    private String placeDescription;
    @OneToMany (mappedBy = "place")
    private Set<Com> comments;
    @OneToMany(mappedBy = "place")
    private Set <Sector> sectors;

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public boolean isTag() {
        return tag;
    }

    public void setTag(boolean tag) {
        this.tag = tag;
    }

    public String getPlaceDescription() {
        return placeDescription;
    }

    public void setPlaceDescription(String placeDescription) {
        this.placeDescription = placeDescription;
    }

    public Set<Com> getComments() {
        return comments;
    }

    public void setComments(Set<Com> comments) {
        this.comments = comments;
    }

    public Set<Sector> getSectors() {
        return sectors;
    }

    public void setSectors(Set<Sector> sectors) {
        this.sectors = sectors;
    }

    public Long getPlaceId() {
        return placeId;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }
}
