const form = document.querySelector("form");
const emailInput = form.querySelector('input[name="email"]');
const confirmedPasswordInput = form.querySelector('input[name="confirm-password"]');

function isEmail(email){
    return /\S+@\S+\.\S+/.test(email);
}

function arePasswordsSame(password, confirmedPassword){
    return password === confirmedPassword;
}

function markValidation(element, condition){
    !condition ? element.classList.add('no-valid') : element.classList.remove('no-valid');
}

emailInput.addEventListener('keyup', () => {
    setTimeout( () => {
            markValidation(emailInput, isEmail(emailInput.value));
        },
        1000
    );
});

confirmedPasswordInput.addEventListener('keyup', () => {
    setTimeout(() => {
        const condition = arePasswordsSame(confirmedPasswordInput.previousElementSibling.value, confirmedPasswordInput.value)
            markValidation(confirmedPasswordInput, condition);
        },
        1000
    );
});