module Simple_Step_Driver(step,dir,en,Output,half_step);
input step,dir,en,half_step;
output reg [3:0]Output;

reg [2:0]counter;
reg [2:0]next_counter; 

always @ (posedge step)
	begin
		if(en)
			begin
				counter = next_counter;
			end
	end

always @ *
begin
	if(half_step)
		begin
			case(counter[2:0])
				0: Output = 4'b1000;
				1: Output = 4'b1100;
				2: Output = 4'b0100;
				3: Output = 4'b0110;
				4: Output = 4'b0010;
				5: Output = 4'b0011;
				6: Output = 4'b0001;
				7: Output = 4'b1001;
			endcase
		
			if(dir)
				begin
					next_counter = counter+1;
				end
			else
				begin
					next_counter = counter-1;
				end
		end
	else
		begin
			case(counter[2:0])
				0: Output = 4'b1000;
				1: Output = 4'b1000;
				2: Output = 4'b0100;
				3: Output = 4'b0100;
				4: Output = 4'b0010;
				5: Output = 4'b0010;
				6: Output = 4'b0001;
				7: Output = 4'b0001;
			endcase
		
			if(dir)
				begin
					next_counter = counter+2;
				end
			else
				begin
					next_counter = counter-2;
				end
		end
end

endmodule
