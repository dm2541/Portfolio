
import java.util.*;

/**
 * 
 */
public interface SubManagerDAO {


    /**
     * @param project_code 
     * @return
     */
    public List<SubManagerVO> selectSubManager(String project_code);

    /**
     * @param subManager 
     * @return
     */
    public void insertSubManager(SubManagerDTO subManager);

    /**
     * @param subManager 
     * @return
     */
    public void deleteSubManager(SubManagerDTO subManager);

}