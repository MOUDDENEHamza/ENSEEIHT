import pytest
from index import index

@pytest.fixture
def liste1():
	return [1, 4, 2, 6]

def tests_nominaux(liste1):
	assert index(liste1, 1) == 0
	assert index(liste1, 4) == 1
	assert index(liste1, 2) == 2
	assert index(liste1, 6) == 3

def tests_erreurs(liste1):
	with pytest.raises(ValueError):
		index(liste1, 7)
	with pytest.raises(ValueError):
		index(liste1, 'x')

def test_avec_str():
	assert index('Bonjour', 'j') == 3

