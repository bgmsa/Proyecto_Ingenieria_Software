package controllers.ms_gestion_economica;

import models.Pago;

import play.mvc.Controller;
import play.mvc.Result;
import play.mvc.Http;
import java.util.List;
import java.util.ArrayList;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;
import com.google.inject.Inject;
import java.io.IOException;
import swagger.SwaggerUtils;
import com.fasterxml.jackson.core.type.TypeReference;

import javax.validation.constraints.*;

import swagger.SwaggerUtils.ApiAction;

@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaPlayFrameworkCodegen", date = "2018-01-05T21:31:07.061Z")

public class GestionDePagosApiController extends Controller {

    private final GestionDePagosApiControllerImp imp;
    private final ObjectMapper mapper;

    @Inject
    private GestionDePagosApiController(GestionDePagosApiControllerImp imp) {
        this.imp = imp;
        mapper = new ObjectMapper();
    }


    @ApiAction
    public Result actualizarPagoPut() throws Exception {
        String valuepromocion = request().getQueryString("promocion");
        Integer promocion;

        promocion = Integer.parseInt(valuepromocion);

        String valuealumno = request().getQueryString("alumno");
        String alumno;

        alumno = (String)valuealumno;

        String valuenumeroPago = request().getQueryString("numeroPago");
        Integer numeroPago;

        numeroPago = Integer.parseInt(valuenumeroPago);

        imp.actualizarPagoPut(promocion, alumno, numeroPago);
        
        return ok();
    }

    @ApiAction
    public Result pagosMatriculaGet() throws Exception {
        String valuepromocion = request().getQueryString("promocion");
        Integer promocion;

        promocion = Integer.parseInt(valuepromocion);

        String valuealumno = request().getQueryString("alumno");
        String alumno;

        alumno = (String)valuealumno;

        List<Pago> obj = imp.pagosMatriculaGet(promocion, alumno);
        JsonNode result = mapper.valueToTree(obj);
        return ok(result);
        
    }
}
