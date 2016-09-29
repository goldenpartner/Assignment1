type label
	label_name :: String
	index :: Int
end

type instruction
	op_code
	operand1
	operand2
end

label_arr = Array{label}(0)
instruction_arr = Array{instruction}(0)

for i = 1 : length(code_arr)
	
	j=1
	input=code_arr[i]

	last = findfirst(input, '\\')
	k = findfirst(input, ':')
	if k != 0

		push!(label_arr,label(input[j:k-1],i))
		j=k+2

		k=findfirst(input[j:last] , ' ')
		if k != 0
			temp1 = input[j:k-1]
			j=k+1

			k=findfirst(input[j:last], ',')
			if k != 0
				temp2 = input[j:k-1]
				j=k+1

				temp3=input[j:last]
				h=temp3[end-1:end]
				if(h=="'d")
    				p=c[1:end-2]
    				p=parse(p)
    				output=hex(p)
    				
  					elseif (h=="'b")
    				p=c[1:end-2]
    				p=string("0b",p)
    				output=parse(p)
    				output=string(output)
    				output=parse(output)
    				output=hex(output)
  				end
				push!(instruction_arr,instruction(temp1, temp2,output))
			else
				push!(instruction_arr,instruction(temp1, temp2, ""))
			end
		else
			push!(instruction_arr,instruction(input[j:last-1], "", ""))
		end

	else

		k=findfirst(input[j:last] , ' ')
		if k != 0
			temp1 = input[j:k-1]
			j=k+1

			k=findfirst(input[j:last], ',')
			if k != 0
				temp2 = input[j:k-1]
				j=k+1

				temp3=input[j:last]
				h=temp3[end-1:end]
				if(h=="'d")
    				p=c[1:end-2]
    				p=parse(p)
    				output=hex(p)

  					elseif (h=="'b")
    				p=c[1:end-2]
    				p=string("0b",p)
    				output=parse(p)
    				output=string(output)
    				output=parse(output)
    				output=hex(output)
  				end
				push!(instruction_arr,instruction(temp1, temp2,output))
			else
				push!(instruction_arr,instruction(temp1, temp2, ""))
			end
		else
			push!(instruction_arr,instruction(input[j:last-1], "", ""))
		end
	end
end
