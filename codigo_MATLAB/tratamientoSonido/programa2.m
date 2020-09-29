% Aplicación 2 - Filtramos una canción, dejando pasar frecuencias bajas de la misma 
[cancion, Fs] = audioread('breakFree.mp3');

%Cogemos un trozo de la canción para su procesamiento
cancionSeq = cancion(Fs*40:Fs*60); %desde el segundo 40 al 60
cancionSeq = cancionSeq';

%Gráfica de la señal
plot(cancionSeq)

fprintf('Pulsa para reproducir el trozo de canción orignal\n');
pause;

sound(cancionSeq, Fs);
%para parar el sonido -> escribir en la ventana de comandos: clear sound
 
fprintf('Pulsa para filtrar frecuencias bajas de la canción\n');
pause;

%Transformaciones
SIGN = fft(cancionSeq);
f = linspace(0, Fs, length(SIGN));
Mono = SIGN(:,1);

%filtro para frecuencias bajas -> sonido graves
faltos = zeros([length(Mono),1]);

for a=1:length(Mono)
    if f(1,a) < 250
        fbajos(a,1) = Mono(a,1);
    else
        fbajos(a,1) = 0;
    end
end

breaka = ifft(fbajos);

fprintf('Pulsa para escuchar la canción modificada\n');
pause;
sound(real(breaka), Fs);
