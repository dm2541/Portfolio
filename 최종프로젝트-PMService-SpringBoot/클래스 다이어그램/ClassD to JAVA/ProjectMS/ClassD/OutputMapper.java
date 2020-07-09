
import java.util.*;

/**
 * 
 */
public interface OutputMapper {

    /**
     * @param task_code 
     * @return
     */
    public List<OutputDTO> selectOutputListByTask(String task_code);

    /**
     * @param project_code 
     * @return
     */
    public List<OutputVO> selectOutputListByProject(String project_code);

    /**
     * @param output_code 
     * @return
     */
    public OutputVO selectOutput(String output_code);

    /**
     * @param output 
     * @return
     */
    public void insertOutput(OutputDTO output);

    /**
     * @param output_code 
     * @return
     */
    public void deleteOutput(String output_code);

}