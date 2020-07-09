
import java.util.*;

/**
 * 
 */
public interface ProjectOutputService {

    /**
     * @param output_name 
     * @return
     */
    public List<OutputDTO> getProjectOutputByName(String output_name);

    /**
     * @param output_type_code 
     * @return
     */
    public List<OutputDTO> getProjectOutputByCategory(String output_type_code);

    /**
     * @param output 
     * @return
     */
    public int putProjectOutput(OutputDTO output);

    /**
     * @param output_code 
     * @return
     */
    public int removeProjectOutput(String output_code);

    /**
     * @param output 
     * @return
     */
    public int postProjectOutput(OutputDTO output);

}