package interpreter

import "wasm.go/binary"

type controlFrame struct {
	opcode byte
	bt     binary.FuncType
	instrs []binary.Instruction
	bp     int
	pc     int
}

func newControlFrame(opcode byte, bt binary.FuncType,
	instrs []binary.Instruction, bp int) *controlFrame {
	return &controlFrame{opcode, bt, instrs, bp, 0}
}

type controlStack struct {
	frames []*controlFrame
}

func (cs *controlStack) pushControlFrame(cf *controlFrame) {
	cs.frames = append(cs.frames, cf)
}

func (cs *controlStack) popControlFrame() *controlFrame {
	cf := cs.frames[len(cs.frames)-1]
	cs.frames = cs.frames[:len(cs.frames)-1]
	return cf
}

func (cs *controlStack) controlDepth() int {
	return len(cs.frames)
}

func (cs *controlStack) topControlFrame() *controlFrame {
	return cs.frames[len(cs.frames)-1]
}

func (cs *controlStack) topCallFrame() (*controlFrame, int) {
	for n := len(cs.frames) - 1; n >= 0; n-- {
		if cf := cs.frames[n]; cf.opcode == binary.Call {
			return cf, len(cs.frames) - 1 - n
		}
	}
	return nil, -1
}
