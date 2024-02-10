using Microsoft.Data.SqlClient;
using root_logic;
using root_logic.LeaveDataSetTableAdapters;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace RootLogic
{
    public class DataManager
    {
        private SqlConnection connection;

        private ExercisesTableAdapter exercisesTableAdapter;
        private UsersTableAdapter usersTableAdapter;
        private WorkoutsTableAdapter workoutsTableAdapter;
        private UserExercisesTableAdapter userExercisesTableAdapter;

        public DataManager()
        {
            connection = new SqlConnection("Data Source=localhost,1433;Initial Catalog=leave;Persist Security Info=True;User ID=sa;Password=AdminAdmin1!;Trust Server Certificate=True");
        
            exercisesTableAdapter = new ExercisesTableAdapter();
            exercisesTableAdapter.Connection = connection;

            usersTableAdapter = new UsersTableAdapter();
            usersTableAdapter.Connection = connection;

            workoutsTableAdapter = new WorkoutsTableAdapter();
            workoutsTableAdapter.Connection = connection;

            userExercisesTableAdapter = new UserExercisesTableAdapter();
            userExercisesTableAdapter.Connection = connection;
        }

        public void LoadData(LeaveDataSet leaveDataSet)
        {
            LeaveDataSet tempDataSet = new LeaveDataSet();

            try
            {
                connection.Open();

                exercisesTableAdapter.Fill(tempDataSet.Exercises);
                usersTableAdapter.Fill(tempDataSet.Users);
                workoutsTableAdapter.Fill(tempDataSet.Workouts);
                userExercisesTableAdapter.Fill(tempDataSet.UserExercises);

                tempDataSet.AcceptChanges();

                leaveDataSet.Clear();

                leaveDataSet.Merge(tempDataSet);

                leaveDataSet.AcceptChanges();
            } catch (SqlException e)
            {
                throw e;
            } catch (System.Exception e)
            {
                throw e;
            } finally
            {
               if (connection.State == System.Data.ConnectionState.Open)
                {
                    connection.Close();
                }
            }
        }   
    }
}
