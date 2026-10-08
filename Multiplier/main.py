import py4hw

hw = py4hw.HWSystem()

reset = hw.wire('reset')
inc = hw.wire('inc')
count = hw.wire('count', 2)

py4hw.ModuloCounter(hw, 'moduleCounter', reset=reset, inc=inc, q=count, carryout=None)



py4hw.gui.Workbench(hw)