import numpy as np
import matplotlib.pyplot as plt

def simulate_gbm(S0, mu, sigma, T, dt, n_simulations):
    """
    Simulasi harga saham menggunakan Geometric Brownian Motion

    Parameters:
    S0 (float): Harga awal saham
    mu (float): Expected return (drift)
    sigma (float): Volatilitas
    T (float): Total waktu simulasi (dalam tahun)
    dt (float): Time step (dalam tahun)
    n_simulations (int): Jumlah simulasi

    Returns:
    numpy.ndarray: Matriks dengan dimensi (n_steps+1) x n_simulations
    """
    n_steps = int(T / dt)
    t = np.linspace(0, T, n_steps + 1)

    # Brownian Motion
    dW = np.random.normal(0, np.sqrt(dt), size=(n_steps, n_simulations))

    # Mengakumulasi perubahan
    W = np.cumsum(dW, axis=0)

    # Menambahkan titik awal
    W = np.vstack([np.zeros((1, n_simulations)), W])

    # Geometric Brownian Motion
    S = S0 * np.exp((mu - 0.5 * sigma**2) * t.reshape(-1, 1) + sigma * W)

    return t, S

# Parameter simulasi
S0 = 100       # Harga awal saham
mu = 0.08      # Expected return tahunan (8%)
sigma = 0.20   # Volatilitas tahunan (20%)
T = 1          # Periode waktu (1 tahun)
dt = 1/252     # Time step (1 hari, asumsi 252 hari trading per tahun)
n_simulations = 10  # Jumlah simulasi

# Jalankan simulasi
t, S = simulate_gbm(S0, mu, sigma, T, dt, n_simulations)

# Plot hasil simulasi
plt.figure(figsize=(12, 6))
for i in range(n_simulations):
    plt.plot(t, S[:, i], lw=1)

plt.title(f'Simulasi Harga Saham (GBM)\nμ={mu:.1%}, σ={sigma:.1%}')
plt.xlabel('Waktu (tahun)')
plt.ylabel('Harga Saham')
plt.grid(True)
plt.show()
