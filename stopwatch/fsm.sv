module fsm(clk, dip_enable,dip_up,push_reset,push_add5,
q0,q1,reset,enable,up,load0,load0_value,load1,load1_value);


input logic clk;
input logic dip_enable;
input logic dip_up;
input logic push_reset;
input logic push_add5;
input logic [3:0]q0;
input logic [3:0]q1;
output logic reset;
output logic enable;
output logic up;
output logic load0;
output logic [3:0] load0_value;
output logic load1;
output logic [3:0] load1_value;

typedef enum {s0,s1,s2,s3,s4,s5,s6} state_type;

state_type current_state, next_state;
always_ff@(posedge clk,negedge push_reset)
begin 
	if(push_reset == 0)
		current_state <= s0;
	else
		current_state <= next_state;
end 


////////next-state logic combined with the output logic /////////
always_comb begin 
	next_state = current_state;
	case(current_state)
		s0:
			begin
				if(push_reset == 1'b0)
					next_state = s0;
				else if(dip_enable == 1'b1)
					next_state = s1;
				else if(dip_enable == 1'b0)
					next_state = s0;
			end
		s1:
			begin 
				if(push_reset == 1'b0)
					next_state = s0;
				else if(dip_up == 1'b1)
					next_state = s2; 
				else if(dip_up == 1'b0)
					next_state = s3; 
			end 
		s2:
			begin
				if(push_reset == 1'b0)
					next_state = s0;
				else if(dip_enable == 1'b0)
					next_state = s4; 
			end 
		s3:
			begin 
				if(push_reset == 1'b0)
					next_state = s0;
				else if(dip_enable == 1'b0)
					next_state = s4;
			end 
		s4:
			begin 
				if(push_reset == 1'b0)
					next_state = s0;
				else if(push_add5==1'b0)
					next_state = s5;
				if(dip_enable == 1'b1)
					begin
						if(dip_up == 1'b1)
							next_state = s2;
						else  
							next_state = s3;
					end 
			end 
		s5:
			begin 				
				if(push_reset == 1'b0)
					next_state = s0;					
				else 
					next_state = s6;
			end 
		s6:
			begin
				if(push_reset == 1'b0)
					next_state = s0;					
				else 
					next_state = s4;
			end
		default:
			begin
				next_state = s0;
			end 
	endcase 
end 

always_comb begin 
enable  = 0;
reset = 0;
up = 1;
load0 = 1;
load1 = 1;
load0_value = 4'b0011;
load1_value = 4'b0000;
case(current_state)
	s0:begin 
		reset = 1;
		enable = 1;
		load0 = 1;
		load1 = 1;
		up = 1;		
	end
	
	s1: begin 
		reset = 0;
		load0 = 0;
		load1 = 0;
		enable = 1;	
	end
	
	s2: begin 
		reset = 0;
		up = 1'b1;
		enable = 1'b1;
				
	end 
	
	s3: begin 
		reset = 0;
		load0 = 0;
		load1 = 0;	
		up = 1'b0;
		enable = 1'b1;
	end 
	
	s4:begin 
		reset = 0;
		enable = 1'b0;
	end 
	
	s5:begin  
			reset = 0;
			load0 = 1;
			if(q0+5>9)
				load1 = 1;
				
			enable  = 1;
	end 
	s6:begin  
			reset = 0;
			enable  = 1;
			if((q0+5)>9)
				begin
					load0_value = (q0)-4;
					load1_value = (q1)+1;
				end
			else 
				begin
					load0_value = q0 + 5;
				end 
	end 

endcase

end 

endmodule 