use core::dict::Felt252DictTrait;

fn multiply_element_by_10(ref dict: Felt252Dict<u32>, n: usize) {
    //TODO : make a function that multiplies the elements stored at the indexes 0 to n of a dictionary by 10
    
    let mut i: usize = 0;
    while i < n {
        let mut x: felt252 = i.into();
        let mut value: u32 = dict.get(x);
        dict.insert(x, value * 10_u32);
        i = i + 1_usize;
    }
    
}

// Don't change anything in the test
#[test]
#[available_gas(2000000000)]
fn test_3() {
    let mut dict: Felt252Dict<u32> = Default::default();
    dict.insert(0, 1);
    dict.insert(1, 2);
    dict.insert(2, 3);

    multiply_element_by_10(ref dict, 3);

    assert(dict.get(0) == 10, 'First element is not 10');
    assert(dict.get(1) == 20, 'Second element is not 20');
    assert(dict.get(2) == 30, 'Third element is not 30');
}

#[test]
#[available_gas(200000000)]
fn test_4() {
    let mut dict: Felt252Dict<u32> = Default::default();
    dict.insert(0, 1);
    dict.insert(1, 2);
    dict.insert(2, 5);
    dict.insert(3, 10);

    multiply_element_by_10(ref dict, 4);

    assert(dict.get(2) == 50, 'First element is not 50');
    assert(dict.get(3) == 100, 'First element is not 100');

}