const userId = document.cookie
    .split('; ')
    .find((row) => row.startsWith('user_id='))
    ?.split('=')[1];

if(userId === undefined){
    location.href = '/login';
}