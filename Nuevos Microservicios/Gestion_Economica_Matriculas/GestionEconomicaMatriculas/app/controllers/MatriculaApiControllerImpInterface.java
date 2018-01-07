package controllers;


import play.mvc.Http;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;

import javax.validation.constraints.*;

public interface MatriculaApiControllerImpInterface {
    Boolean reservaMatriculaGet( @NotNull Integer promocion,  @NotNull String alumno) throws Exception;

    void reservaMatriculaPut( @NotNull Integer promocion,  @NotNull String alumno) throws Exception;

}
