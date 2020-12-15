<template>
  <canvas
    width="1000"
    height="1000"
    class="canvas"
  />
</template>

<script>
export default {
  props: {
    side: {
      type: Number,
      default: 50,
    },
    vertical: {
      type: Number,
      default: 50,
    }
  },
  data() {
    return {
      ctx: null,
      icon: null
    }
  },
  watch: {
    side() {
      this.draw(this.side, this.vertical)
      this.ctx.clearRect(0, 0, 1000, 1000)
    },
    vertical() {
      this.draw(this.side, this.vertical)
    }
  },
  mounted() {
    this.ctx = this.$el.getContext('2d')
    this.draw(this.side, this.vertical)
    // TODO: ランダムで敵が沸くようにする
    this.spawnEnemy(500, 300)
    this.spawnEnemy(500, 500)
  },
  methods: {
    draw(side, vertical) {
      const img = new Image()
      img.src = require('@/assets/icons/images.jpg')
      img.onload = () => {
        this.ctx.clearRect(side - 20, vertical - 20, side, vertical)
        // 画像, 横移動, 縦移動
        this.ctx.drawImage(img, side, vertical)
      }
    },
    spawnEnemy(side, vertical) {
      const ctx = this.$el.getContext('2d')
      const enemy = {
        ctx,
        side,
        vertical,
      }
      // 右移動の処理
      const id = setInterval(() => {
        const num = this.abs(enemy.side)
        // あたり判定
        if (num < 60000 && this.vertical - 100 < enemy.vertical && enemy.vertical < this.vertical + 300 && this.side < enemy.side) {
          enemy.ctx.clearRect(enemy.side - 50, enemy.vertical - 50, enemy.side, enemy.vertical)
          clearInterval(id)
        } else {
          enemy.ctx.beginPath()
          enemy.ctx.clearRect(enemy.side - 50, enemy.vertical - 50, enemy.side + 250, enemy.vertical + 50)
          enemy.ctx.arc(enemy.side, enemy.vertical, 50, 0, Math.PI * 2)
          enemy.ctx.fill()
          enemy.side = enemy.side - 5
          // 画面外に出たら削除
          if (enemy.side < -50) {
            enemy.ctx.clearRect(enemy.side - 50, enemy.vertical - 50, enemy.side, enemy.vertical)
            clearInterval(id)
          }
        }
      }, 50)
    },
    abs (s) {
      const sn = (Number(s) - Number(this.side)) * (Number(s) - Number(this.side))
      return sn
    }
  }
}
</script>

<style scoped>
.canvas {
  width: 100%;
  height: 100vh;
}
</style>
