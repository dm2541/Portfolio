
import java.util.*;

/**
 * 
 */
public interface DashBoardUserService {

    /**
     * @param user_id 
     * @return
     */
    public UserCountVO getDashBoardUserCount(String user_id);

    /**
     * @param user_id 
     * @return
     */
    public List<TaskStatusCountVO> getTaskStatusCountUser(String user_id);

    /**
     * @param user_id 
     * @return
     */
    public List<OutputVO> getMyOutputList(String user_id);

    /**
     * @param user_id 
     * @return
     */
    public List<IssueStatusCountVO> getIssueStatusCountUser(String user_id);

    /**
     * @param user_id 
     * @return
     */
    public List<MyTaskVO> getMyTaskList(String user_id);

}