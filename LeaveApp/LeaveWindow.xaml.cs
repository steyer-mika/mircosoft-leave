using Microsoft.Data.SqlClient;
using root_logic;
using RootLogic;
using System.Collections;
using System.Data;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.ComponentModel;

namespace LeaveApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        LeaveDataSet leaveDataSet;

        private ICollectionView workoutsView;

        public MainWindow()
        {
            InitializeComponent();
            
            leaveDataSet = (LeaveDataSet) FindResource("leaveDataSet");

            workoutsView = ((CollectionViewSource) FindResource("workoutsViewSource")).View;

            LoadFromFile();
        }

    
        public void RefreshBindings()
        {
            if (leaveDataSet.Users.Count > 0)
            {
                UsersGrid.DataContext = leaveDataSet.Users.First();
            }
            else
            {
                MessageBox.Show("No users found in the dataset.");
            }
        }

        private void LoadFromDatabase()
        {
            MessageBoxResult confirmLoad = MessageBox.Show(
                "Dadurch werden alle von Ihnen vorgenommenen Änderungen überschrieben. Sind Sie sicher, dass Sie Daten aus der Datenbank laden möchten?",
                "Aus Datenbank laden",
                MessageBoxButton.YesNo,
                MessageBoxImage.Warning
            );

            if (confirmLoad == MessageBoxResult.No)
            {
                return;
            }

            try
            {
                DataManager dataManager = new DataManager();

                Cursor = Cursors.Wait;

                dataManager.LoadData(leaveDataSet);

                RefreshBindings();
            }
            catch (SqlException ex) {
                MessageBox.Show(ex.ToString(), "SQL Fehler", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Fehler", MessageBoxButton.OK, MessageBoxImage.Error);
            } finally
            {
                Cursor = Cursors.Arrow;
            }
        }

        private void LoadFromFile() {
            try
            {
                leaveDataSet.Clear();

                Cursor = Cursors.Wait;

                leaveDataSet.ReadXml("leave.xml");

                RefreshBindings();
            } catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Fehler", MessageBoxButton.OK, MessageBoxImage.Error);
            } finally
            {
                Cursor = Cursors.Arrow;
            }
        }

        private void SaveToFile(bool notifyUser = true) {
            try
            {
                leaveDataSet.WriteXml("leave.xml", XmlWriteMode.DiffGram);

                if (notifyUser)
                {
                    MessageBox.Show("Daten erfolgreich gespeichert.", "Speichern", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            } catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Fehler", MessageBoxButton.OK, MessageBoxImage.Error);
            } finally
            {
                Cursor = Cursors.Arrow;
            }
        }

        // Event handlers

        private void LoadFromFile_Click(object sender, RoutedEventArgs e) {
            LoadFromFile();
        }

        private void SaveToFile_Click(object sender, RoutedEventArgs e) {
            SaveToFile();
        }

        private void LoadFromDatabase_Click(object sender, RoutedEventArgs e)
        {
            LoadFromDatabase();
        }

        private void MenuClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Window_Closing(object sender, CancelEventArgs e)
        {
            SaveToFile(false);
        }
    }
}