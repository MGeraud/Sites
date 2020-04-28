package entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Topo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int year ;
    private String topoName;
    private boolean topoAvailable ;
    private String topoDescription ;
    private String topoLieu ;
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

    public String getTopoLieu() {
        return topoLieu;
    }

    public void setTopoLieu(String topoLieu) {
        this.topoLieu = topoLieu;
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
}
