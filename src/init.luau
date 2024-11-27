---@class FunctionLib
local FunctionLib = {}

--[=[
		Welds Model A to Model B. 
		Model A and Model B must have Primary Parts, otherwise
		an error will be thrown!

		@error "Missing Primary Part" -- One of your models passed is missing a Primary Part!

		@param A Model | BasePart 
		@param B Model | BasePart 
		@return WeldConstraint

	]=]

function FunctionLib:Weld(A: Model | BasePart, B: Model | BasePart)
	local PartToWeldA = A
	local PartToWeldB = B

	if A:IsA("Model") then
		assert(A.PrimaryPart, `Missing Primary Part! (Model A)`)

		PartToWeldA = A.PrimaryPart
	end

	if B:IsA("Model") then
		assert(B.PrimaryPart, `Missing Primary Part! (Model B)`)

		PartToWeldB = B.PrimaryPart
	end

	local Weld = Instance.new("WeldConstraint") :: WeldConstraint
	Weld.Parent = PartToWeldA
	Weld.Part0 = PartToWeldA
	Weld.Part1 = PartToWeldB

	return Weld
end

return table.freeze(FunctionLib)
