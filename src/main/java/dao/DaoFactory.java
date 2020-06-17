package dao;

public class DaoFactory {
    public static Dao getMultipitchDao(){
        return new MultiPitchDao();
    }

    public static Dao getBoulderDao(){
        return new BoulderDao();
    }

    public static Dao getSinglePitchDao(){
        return new SinglePitchDao();
    }

    public static Dao getRouteDao(){
        return new RouteDao();
    }

    public static Dao getPlaceDao(){
        return new PlaceDao();
    }

    public static Dao getClimberDao(){
        return new ClimberDao();
    }

    public static Dao getTopoDao(){
        return new TopoDao();
    }

    public static Dao getComDao() { return new ComDao();}

    public static Dao getSectorDao() { return new SectorDao();}
}
