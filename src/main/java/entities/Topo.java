package entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Topo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int year ;
    @Column(name = "topo_name")
    private String topoName;
    @Column(name = "topo_available")
    private boolean topoAvailable ;
    private boolean booking = false;
    @Lob
    @Column(name = "topo_description")
    private String topoDescription ;
    @Column(name = "topo_place")
    private String topoPlace;
    @ManyToOne
    private Climber climber;

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getTopoName() {
        return topoName;
    }

    public void setTopoName(String topoName) {
        this.topoName = topoName;
    }

    public boolean isTopoAvailable() {
        return topoAvailable;
    }

    public void setTopoAvailable(boolean topoAvailable) {
        this.topoAvailable = topoAvailable;
    }

    public String getTopoDescription() {
        return topoDescription;
    }

    public void setTopoDescription(String topoDescription) {
        this.topoDescription = topoDescription;
    }

    public String getTopoPlace() {
        return topoPlace;
    }

    public void setTopoPlace(String topoLieu) {
        this.topoPlace = topoLieu;
    }

    public Climber getClimber() {
        return climber;
    }

    public void setClimber(Climber climber) {
        this.climber = climber;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isBooking() {
        return booking;
    }

    public void setBooking(boolean booking) {
        this.booking = booking;
    }
}
