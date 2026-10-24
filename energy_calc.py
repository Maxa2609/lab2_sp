import re

def read(fn):
    d = {}
    for line in open(fn):
        m = re.search(r'([\d.]+)\s+Joules\s+power/energy-(\w+)/', line)
        if m:
            d[m.group(2)] = float(m.group(1))
        m = re.search(r'([\d.]+)\s+\+-\s+[\d.]+\s+seconds time elapsed', line)
        if m:
            d['t'] = float(m.group(1))
    return d

idle = read('energy_idle.txt')
p_pkg = idle['pkg'] / idle['t']
p_ram = idle['ram'] / idle['t']
print(f"Idle power: pkg = {p_pkg:.2f} W, ram = {p_ram:.2f} W")
print()
print(f"{'program':8} {'time,s':>8} {'pkg,J':>8} {'ram,J':>7} {'3.1 system,J':>13} {'3.2 program,J':>14} {'avg pkg,W':>10}")
res = {}
for name in ('mm0', 'mm3'):
    d = read(f'energy_{name}.txt')
    system = d['pkg'] + d['ram']
    prog = d['pkg'] - p_pkg * d['t']
    res[name] = (d['t'], system, prog)
    print(f"{name:8} {d['t']:8.3f} {d['pkg']:8.2f} {d['ram']:7.2f} {system:13.2f} {prog:14.2f} {d['pkg']/d['t']:10.1f}")
print()
print(f"Speedup:             {res['mm0'][0] / res['mm3'][0]:.1f}x")
print(f"System energy gain:  {res['mm0'][1] / res['mm3'][1]:.1f}x")
print(f"Program energy gain: {res['mm0'][2] / res['mm3'][2]:.1f}x")
