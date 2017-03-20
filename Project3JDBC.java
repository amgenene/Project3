import java.sql.*;
import java.util.*;


public class Reporting {

	public static void main(String[] args) {
		String username = "";
		String password = "";
		String[] userInput;
		int thirdArg = 0;

		// May have to add 1 if it counts program name
		if (args.length == 2) {
			System.out.println("1 - Report Customer Information");
			System.out.println("2 - Report Tour Guide Information");
			System.out.println("3 - Report Booked Tour Information");
			System.out.println("4 - Update Booked Tour Vehicle");
			return;
		} else if (args.length == 3) {
			try {
				username = args[0];
				password = args[1];
				thirdArg = Integer.parseInt(args[2]);
				if ((thirdArg > 4) || (thirdArg < 1)) {
					System.out.println("Invalid 3rd argument. Must be 1, 2, 3, or 4");
					return;
				}
				userInput = getUserInput(thirdArg);
			} catch (NumberFormatException e) {
				System.out.println("Invalid 3rd argument. Must be 1, 2, 3, or 4");
				return;
			}
		} else {
			System.out.println("Invalid number of arguments");
			System.out.println("Proper use: java Reporting.java <username> <password> <(optional) additional argument>");
			return;
		}
		System.out.println("-------Oracle JDBC Connection Testing ---------");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

		} catch (ClassNotFoundException e){
			System.out.println("Where is your Oracle JDBC Driver?");
			e.printStackTrace();
			return;
		}

		System.out.println("Oracle JDBC Driver Registered!");
		Connection connection = null;

		try {
			connection = DriverManager.getConnection("jdbc:oracle:thin:@oracle.wpi.edu:1521:orcl", username, password);
		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;
		}
		System.out.println("Oracle JDBC Driver Connected!");

		switch (thirdArg) {
		case 1:
			PatientInfo(userInput[0], connection);
			break;
		case 2:
			DoctorInfo(userInput[0], connection);
			break;
		case 3:
			AdmissionsInfo(userInput[0], connection);
			break;
		case 4:
			UpdateAdmissionsInfo(userInput[0], userInput[1], connection);
			break;
		}
	}


	public static void PatientInfo(String patientSSN, Connection connection){
		// Performing the query
		try {

			Statement stmt = connection.createStatement();
			String str = "SELECT * FROM Patient WHERE SSN = '" + patientSSN + "'";
			ResultSet rset = stmt.executeQuery(str);

			String SSN = "";
			String firstName = "";
			String lastName = "";
			String address = "";
			String telNum = "";
			
			// Process the results

			int loopCount = 0;

			while (rset.next()) {
				loopCount++;
				SSN = rset.getString("SSN");
				firstName = rset.getString("FirstName");
				lastName = rset.getString("LastName");
				address = rset.getString("Address");
				telNum = rset.getString("TelNum");

				System.out.println("SSN: " + SSN);
				System.out.println("First Name: " + firstName);
				System.out.println("Last Name: " + lastName);
				System.out.println("Address: " + address);
				System.out.println("Phone: " + telNum);

			} // end while

			if (loopCount == 0) {
				System.out.println("No results found");
			}

			rset.close();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Get Data Failed! Check output console");
			e.printStackTrace();
			return;			
		}
	}


	public static void DoctorInfo(String doctorID, Connection connection){
		// Performing the query
		try {
			Statement stmt = connection.createStatement();
			String str = "SELECT * FROM Doctor WHERE ID = '" + doctorID +"'";
			ResultSet rset = stmt.executeQuery(str);

			String ID = "";
			String firstName = "";
			String lastName = "";
			String gender = "";
			String specialty = "";

			int loopCount = 0;

			// Process the results
			while (rset.next()) {
				loopCount++;
				ID = rset.getString("ID");
				firstName = rset.getString("FirstName");
				lastName = rset.getString("LastName");
				gender = rset.getString("Gender");
				specialty = rset.getString("Specialty");


				System.out.println("ID: " + ID);
				System.out.println("First Name: " + firstName);
				System.out.println("Last Name: " + lastName);
				System.out.println("Gender: " + gender);
				System.out.println("Specialty: " + specialty);

			} // end while

			if (loopCount == 0) {
				System.out.println("No results found");
			}

			rset.close();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Get Data Failed! Check output console");
			e.printStackTrace();
			return;			
		}
	}

	public static void AdmissionsInfo(String admissionNum, Connection connection) {
		try {
			Statement stmt = connection.createStatement();
			Statement twStatement = connection.createStatement();		
			
			String str = "SELECT Num, SSN, date, TotalPayment FROM Admission WHERE Num = '" + admissionNum + "'";;
			String roomstr = "SELECT AdmissionNum, StartDate, endDate, RoomNum FROM StayIn WHERE AdmissonNum = '" + admissionNum + "'";
			String doctorstr = "SELECT ID FROM Examine WHERE AdmissionNum = '" + admissionNum + "'";;
			
			ResultSet rset = stmt.executeQuery(str);
			ResultSet roomrset = stmt.executeQuery(roomstr);
			ResultSet doctorset = stmt.executeQuery(doctorstr);
			
			// Process the results
			int loopCount = 0;
			while (rset.next()) {
				loopCount++; 
				if (loopCount == 1) {
					System.out.println("Admission Number: " + admissionNum);
					System.out.println("Patient SSN: " + rset.getString("SSN"));
					System.out.println("Admission date (start date): " + rset.getString("date"));
					System.out.println("Total Payment: " + rset.getString("TotalPayment"));
					
				}
				
				System.out.println("Rooms:");
				while (roomrset.next()) {
					System.out.println("\tRoomNum: " + roomrset.getString("RoomNum") + " FromDate: " + roomrset.getString("StartDate") + " ToDate: " + roomrset.getString("endDate"));
				}
				roomrset.close();
				
				System.out.println("Doctors examined the patient in this admission:");
				while (doctorset.next()) {
					System.out.println("\tDoctor ID: " + doctorset.getString("ID"));
				}
				
				doctorset.close();
				
				
			} // end while

			if (loopCount == 0) {
				System.out.println("No results found");
			}
			rset.close();
			stmt.close();
			twStatement.close();
			connection.close();
		}
		catch (SQLException e) {
			System.out.println("Get Data Failed! Check output console");
			e.printStackTrace();
			return;			
		}
	}

	public static void UpdateAdmissionsInfo(String admissionNum, String totalPayment, Connection connection) {
		try {
			String updateStr = "UPDATE Admission SET  = ? WHERE admissionNum = '" + admissionNum+ "'";
			PreparedStatement pstatement = connection.prepareStatement(updateStr);

			pstatement.setString(1, totalPayment);

			pstatement.executeUpdate();

			pstatement.close();
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}



	private static String[] getUserInput(int commandArg) {
		String[] data = new String[5];


		Scanner in = new Scanner(System.in);

		if (commandArg == 4) {
			System.out.print("Enter Admission Number: ");
			data[0] = in.nextLine();

			System.out.print("Enter the new total payment: ");
			data[1] = in.nextLine();

		} else {
			switch(commandArg) {
			case 1:
				System.out.print("Enter Patient SSN: ");
				data[0] = in.nextLine();
				break;
			case 2:
				System.out.print("Enter Doctor ID: ");
				data[0] = in.nextLine();
				break;
			case 3:
				System.out.print("Enter Admission Number: ");
				data[0] = in.nextLine();
				break;
			}

		}

		in.close();

		return data;
	}
}