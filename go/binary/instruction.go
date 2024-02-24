package binary

type Expr = []Instruction

type Instruction struct {
	Opcode byte
	Args   interface{}
}

func (instr Instruction) GetOpname() string {
	return opnames[instr.Opcode]
}

type MemArg struct {
	Align  uint32
	Offset uint32
}

type BlockType = int32

type BlockArgs struct {
	BT     BlockType
	Instrs []Instruction
}

type IfArgs struct {
	BT      BlockType
	Instrs1 []Instruction
	Instrs2 []Instruction
}

type BrTableArgs struct {
	Labels  []LabelIdx
	Default LabelIdx
}

func (instr Instruction) String() string {
	return opnames[instr.Opcode]
}