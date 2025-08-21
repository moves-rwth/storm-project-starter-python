from stormpy_starter import check


def test_prop1():
    answer = check.check("examples/die.pm", "examples/die.pctl")
    assert not answer


def test_prop2():
    answer = check.check("examples/die.pm", "examples/die2.pctl")
    assert answer
