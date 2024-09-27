package commandModel;

import imodel.ICommand;

public class CommandFactory {
	private CommandFactory () {};
	private static CommandFactory commandfactory = new CommandFactory();
	
	public static CommandFactory newcommandInstance () {
		return commandfactory;
	}
	
	public ICommand createcommandInstance(String command) {
		if(command.equals("LOGIN")) {
			return new LoginCommand();
		}else if(command.equals("LOGINCONFIRM")) {
			return new LoginConfirmCommand();
		}else if(command.equals("SIGNUP")) {
			return new SignupCommand();
		}else if(command.equals("CUSTOMER")) {			
			return new CustomerCommand();
		}else if(command.equals("RESERVATION")) {
			return new ReservationCommand();
		}else if(command.equals("SERVICE")) {
			return new ServiceCommand();
		}else if(command.equals("PRODUCT")) {
			return new ProductCommand();
		}else if(command.equals("MEMBER")) {
			return new MemberCommand();
		}else if(command.equals("NOTICE")) {
			return new NoticeCommand();
		}else {
			return new WrongCommand();
		}
	}
}
