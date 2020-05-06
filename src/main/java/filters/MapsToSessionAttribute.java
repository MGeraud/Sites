package filters;


import dao.PlaceDao;
import entities.Place;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MapsToSessionAttribute implements Filter {

    private static final String ATT_SESSION_PLACES          ="places";
    private PlaceDao placeDao;
    public void init(){this.placeDao = placeDao;}
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        /**
         * Creation d'un filtre pour mettre en session une Map contenant la liste de tous les sites d'escalade
         *
         */

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();

        if (session.getAttribute(ATT_SESSION_PLACES) == null){
            List<Place> placesList = placeDao.listAllPlaces();
            Map<Long, Place> mapPlaces = new HashMap<Long, Place>();
            for (Place place: placesList) {
                mapPlaces.put(place.getPlaceId(),place);
            }
            session.setAttribute(ATT_SESSION_PLACES , mapPlaces);
        }
        filterChain.doFilter(request, servletResponse);
    }
}
