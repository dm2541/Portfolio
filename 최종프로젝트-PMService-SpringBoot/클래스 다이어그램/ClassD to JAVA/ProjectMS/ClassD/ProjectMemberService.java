
import java.util.*;

/**
 * 
 */
public interface ProjectMemberService {

    /**
     * @param projectMember 
     * @return
     */
    public int postProjectMember(ProjectMemberDTO projectMember);

    /**
     * @param project_joinCode 
     * @return
     */
    public int removeProjectMember(String project_joinCode);

}